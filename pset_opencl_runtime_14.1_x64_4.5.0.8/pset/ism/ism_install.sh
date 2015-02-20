#!/bin/bash
#
# Copyright (C) 2002-2014, Intel Corporation. All rights reserved.
#
# The source code, information and material ("Material") contained herein is owned by Intel Corporation
# or its suppliers or licensors, and title to such Material remains with Intel Corporation or its suppliers
# or licensors. The Material contains proprietary information of Intel or its suppliers and licensors.
# The Material is protected by worldwide copyright laws and treaty provisions. No part of the Material may be
# used, copied, reproduced, modified, published, uploaded, posted, transmitted, distributed or disclosed in
# any way without Intel's prior express written permission. No license under any patent, copyright or other
# intellectual property rights in the Material is granted to or conferred upon you, either expressly, by implication,
# inducement, estoppel or otherwise. Any license under such intellectual property rights must be express and approved
# by Intel in writing.
#
# Unless otherwise agreed by Intel in writing, you may not remove or alter this notice or any other notice embedded
# in Materials by Intel or Intel’s suppliers or licensors in any way.
#

function COMPARE_VERSION(){
    local A=$1
    local B=$2
    local COMPARE_RESULT=0
    local INDEX=1
    local CA="1"
    local CB="2"

    if [ $(echo $A | grep -v "\.") ] && [ $(echo $B | grep -v "\.") ]; then
        if [ "$A" -gt "$B" ] ; then
            COMPARE_RESULT=1
        elif [ "$B" -gt "$A" ] ; then
            COMPARE_RESULT=255
        fi
        return $COMPARE_RESULT
    fi

    while [ "$CA" != "" ] && [ "$CB" != "" ] ; do
        CA=$(echo $A | cut -d'.' -f${INDEX})
        CB=$(echo $B | cut -d'.' -f${INDEX})
        if [ "$CA" != "" ] && [ "$CB" = "" ] ; then
                COMPARE_RESULT=1
        elif [ "$CA" = "" ] && [ "$CB" != "" ] ; then
            COMPARE_RESULT=255
        elif [ "$CA" != "" ] && [ "$CB" != "" ] ; then
            if [ "$CA" -gt "$CB" ] ; then
                COMPARE_RESULT=1
            elif [ "$CB" -gt "$CA" ] ; then
                COMPARE_RESULT=255
            fi
            if [ $COMPARE_RESULT -ne 0 ] ; then
                break
            fi
        fi
        INDEX=$(($INDEX+1))
    done
    
    return $COMPARE_RESULT
    
}

install() {
    if [ ! -d "$INSTALL_DIR" ]; then
        mkdir -p "$INSTALL_DIR" 2>/dev/null 1>&2
        if [ $? -ne 0 ]; then
            log "install: ERROR: problems to create the $INSTALL_DIR... installation cancelled"
            return 1
        fi
    fi

    # comparing versions
    local cur_ver="${ISM_VERSION}"
    local inst_ver="$(sed 's/VERSION=//g' $INSTALL_DIR/support.txt 2>/dev/null)"
    local need_uninstall=0

    if [ ! -z "$inst_ver" ]; then
        log "install: installed version of ISM found = $inst_ver"
        COMPARE_VERSION "$cur_ver" "$inst_ver"
        if [ $? -eq 1 ]; then # more
            log "install: current version is newer than existing one!"
            need_uninstall=1
        else
            log "install: current version is older or equal to existing one...skipping installation of current version"
            return 0
        fi
    else
        log "install: no installed versions found in $INSTALL_DIR"
    fi

    # unpacking ISM to temp location
    local tmpdir=$(mktemp -d "/tmp/ism2.XXXXXX")
    log -n "install: unpacking $ZIP_TO_INSTALL to $tmpdir ..."
    tar -xzvf "$ZIP_TO_INSTALL" -C "$tmpdir" 2>/dev/null 1>&2
    if [ $? -ne 0 ]; then
        log "FAIL"
        return 0
    else
        log "OK"
    fi

    # run test binary to test whether the system is ok for ISM
    log "install: check if ISM can be run on this system"
    LD_LIBRARY_PATH=$tmpdir/qt/$march/lib $tmpdir/bin/$march/runtest
    if [ $? -ne 0 ]; then
        log "install: ISM can NOT be run here... skip the installation"
        return 0
    else
        log "install: ISM can be run here!"
        if [ $need_uninstall -ne 1 ]; then
            log "install: uninstalling old version..."
            rm -rf $HOME/intel/ism/app.conf $INSTALL_DIR/bin $INSTALL_DIR/plugins $INSTALL_DIR/ism $INSTALL_DIR/qt $INSTALL_DIR/*.txt $INSTALL_DIR/lib $INSTALL_DIR/*.jar $INSTALL_DIR/db/*.dat 2>/dev/null 1>&2
        fi
        log -n "install: installing a new one..."
        cp -r $tmpdir/* $INSTALL_DIR 2>/dev/null 1>&2
        if [ $? -ne 0 ]; then
            log "FAIL"
        else
            log "OK"
            # TODO: ISM self-registration
        fi
    fi
    rm -rf "$tmpdir" 2>/dev/null 1>&2
    
    log "install: successfully installed"
}

vars_dump () {
    log "vars_dump: SCRIPT_DIR=$SCRIPT_DIR"
    log "vars_dump: LI_IS_ROOT=$LI_IS_ROOT"
}

log () {
    echo $*
}

: #============================================================================
: # here the script starts

umask 022

ARCH=$(uname -m)
if [ "ia64" = "$ARCH" ]; then
    [ $silent_mode -eq 0 ] && echo "The platform is not supported."
    return 1;
elif [ "x86_64" = "$ARCH" ]; then
    march="intel64"
else
    march="ia32"
fi

ISM_VERSION="2.0.012"

LI_IS_ROOT="$1"

# if empty (script called not from PSET), check current user ID
if [ -z "$LI_IS_ROOT" ]; then
    if [ "$(id -u)" = "0" ]; then
        LI_IS_ROOT="yes"
    else
        LI_IS_ROOT="no"
    fi
fi

SCRIPT_DIR=$(cd $(dirname ${0}) 2>/dev/null; pwd)

cd $SCRIPT_DIR 2>/dev/null 1>&2

ZIP_TO_INSTALL="${SCRIPT_DIR}/ism-2.0.012.tgz"

if [ "x${LI_IS_ROOT}" = "xyes" ]; then
    INSTALL_DIR="/opt/intel/ism"
else
    INSTALL_DIR="$HOME/intel/ism"
fi

log "-------- ISM install: start... --------"
install
log "-------- ISM install: end... --------"

cd - 2>/dev/null 1>&2
