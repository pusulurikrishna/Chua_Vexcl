#!/bin/sh

# Copyright (c) 2006-2014 Intel Corporation. All rights reserved.
# This script installs Intel(R) Software Development Products.
EXIT_CODE_SUCCESS=0
EXIT_CODE_GUI_RUN_ERROR=1
EXIT_CODE_ERROR=2

touch_space()
{
    local dir_to_check=$1
    local dir_end_path='hags7823782318#@123kjhknmnzxmnz'
    local err=0

    if [ -d "$dir_to_check" ] ; then 
        if [ -w "$dir_to_check" ] ; then
            mkdir "$dir_to_check/$dir_end_path" >/dev/null 2>&1
            err=$?
            if [ "$err" = "0" ] ; then
                local test_file="$dir_to_check/$dir_end_path/test.sh"
                echo "#!/bin/sh" > $test_file
                echo "exit 0" >> $test_file
                chmod +x $test_file >/dev/null 2>&1
                $test_file >/dev/null 2>&1
                err=$?
                if [ "$err" != "0" ] ; then
                  err=2
                fi
                rm -f $test_file >/dev/null 2>&1
                rmdir "$dir_to_check/$dir_end_path" >/dev/null 2>&1
            fi
        else
            err=1
        fi
    else
        touch_space "`dirname $dir_to_check`" "$dir_end_path"
        err=$?
    fi

    return $err
}

check_free_space()
{
    location=$1
    need_space=$2
    real_location=$location
    while [ ! -d "$real_location" ] ; do
        real_location=$(dirname $real_location)
    done
    exist_space=$(df -Pm $real_location | tail -n1 | tr -s "[:space:]" | cut -d ' ' -f 4)
    if [ "$need_space" -gt "$exist_space" ]; then
        echo "Error: not enough disk space in temporary folder \"$real_location.\""
        echo "Available: ${exist_space}M"
        echo "Required: ${need_space}M"
        echo ""
        echo "Quitting!"
        exit $EXIT_CODE_ERROR
    fi
}

check_cpu_model() {
    CPU_FAMILY=$(echo $(grep family /proc/cpuinfo |head -1|cut -d: -f2))
    CPU_MODEL=$(echo $(grep model /proc/cpuinfo |head -1|cut -d: -f2))

    if [ "ia64" = "$(uname -m)" ]; then
        return
    fi

    MIN_FAMILY=6
    MIN_MODEL=14

    if [ $CPU_FAMILY -lt $MIN_FAMILY ]; then
        echo "CPU is not supported."
        exit $EXIT_CODE_ERROR
    elif [ $CPU_FAMILY -eq $MIN_FAMILY ] && [ $CPU_MODEL -lt $MIN_MODEL ]; then
        echo "CPU is not supported."
        exit $EXIT_CODE_ERROR
    fi
}

prepare_pset_binary()
{
    # check for zip feature 
    if [ -f "$fullpath/pset/$pset_archive_name" ]; then
        old_structure_type="no"
    fi

    if [ "$old_structure_type" = "yes" ]; then
        check_free_space $user_tmp $require_tmp_space_org
        # check the platform support
        if [ ! -r "$fullpath" ] || [ ! -x "$fullpath" ]; then
            echo "The installation script is lauched from the directory which does not have required access permissions."
            echo "Please copy the package to other location which is accessible by $USER user";
            echo 
            echo "Quitting!"
            exit $EXIT_CODE_ERROR
        fi;
        if [ ! -f "$fullpath/pset/$my_arch/install_gui" ] && [ ! -f "$fullpath/pset/$my_arch/install" ]; then
            if [ ! -d "$fullpath/pset/$my_arch" ]; then
                echo "The package does not support the platform it being run on."
                echo "Please check to be sure the correct architecture of package has been downloaded."
                echo ""
                echo "Quitting!"
                exit $EXIT_CODE_ERROR
            fi
            if [ ! -x "$fullpath/pset/$my_arch" ]; then
                if [ "yes" = "$skip_gui_install" ]; then
                    echo "Can not execute $fullpath/pset/$my_arch/install: permission denied."
                else
                    echo "Can not execute $fullpath/pset/$my_arch/install_gui: permission denied."
                fi
                echo "Please check the package was unpacked with proper permissions."
                echo ""
                echo "Quitting!"
                exit $EXIT_CODE_ERROR
            fi

            echo "The package does not support the platform it being run on."
            echo "Please check to be sure the correct architecture of package has been downloaded."
            echo ""
            echo "Quitting!"
            exit $EXIT_CODE_ERROR
        fi

        if [ ! -x "$fullpath/pset/$my_arch/install_gui" ]; then
            skip_gui_install=yes
            if [ ! -x "$fullpath/pset/$my_arch/install" ]; then
                echo "Can not execute $fullpath/pset/$my_arch/install_gui: permission denied."
                echo "Please check the package was unpacked with proper permissions."
                echo ""
                echo "Quitting!"
                exit $EXIT_CODE_ERROR
            fi
        fi

        if [ -z "${libstdc_exist}" ]; then
            libstdc_path="$fullpath/pset/$my_arch/gcc-3.2"
        fi

        if [ -z "${libz_exist}" ]; then
            libz_path="$fullpath/pset/$my_arch/libz"
        fi

        libqt_path="$fullpath/pset/$my_arch/qt"

        LD_LIBRARY_PATH="$fullpath/pset/$my_arch:$libstdc_path:$libqt_path:$libz_path:$LD_LIBRARY_PATH"
        export LD_LIBRARY_PATH
        cd $fullpath/pset/$my_arch > /dev/null 2>&1

        pset_engine_binary="$fullpath/pset/$my_arch/install_gui"
        pset_engine_folder="$fullpath/pset/$my_arch"
        if [ -f "$fullpath/pset/$my_arch/install" ]; then
            pset_engine_cli_binary="$fullpath/pset/$my_arch/install"
        fi
    else
        if [ ! -r "$fullpath" ] || [ ! -x "$fullpath" ]; then
            echo "The installation script is lauched from the directory which does not have required access permissions."
            echo "Please copy the package to other location which is accessible by $USER user";
            echo 
            echo "Quitting!"
            exit $EXIT_CODE_ERROR
        fi;
        echo "Extracting, please wait..."
        check_free_space $user_tmp $require_tmp_space_zip
        temp_dir="$user_tmp/intel.pset.$USER.${HOSTNAME}_$(date +%m.%d.%H.%M.%S.%Y)"
        mkdir -p $temp_dir
        tar zxf $fullpath/pset/$pset_archive_name -C $temp_dir &>/dev/null

        # check the platform support
        if [ ! -f "$temp_dir/$my_arch/install_gui" ]; then
            echo "The package does not support the platform it being run on."
            echo "Please check to be sure the correct architecture of package"
            echo "has been downloaded."
            echo ""
            echo "Quitting!"
            exit $EXIT_CODE_ERROR
        fi

        if [ -z "${libstdc_exist}" ]; then
            libstdc_path="$temp_dir/$my_arch/gcc-3.2"
        fi

        if [ -z "${libz_exist}" ]; then
            libz_path="$temp_dir/$my_arch/libz"
        fi

        libqt_path="$temp_dir/$my_arch/qt"

        LD_LIBRARY_PATH="$temp_dir/$my_arch:$libstdc_path:$libqt_path:$libz_path:$LD_LIBRARY_PATH"
        export LD_LIBRARY_PATH
        cd $temp_dir/$my_arch > /dev/null 2>&1

        pset_engine_binary="$temp_dir/$my_arch/install_gui"
        if [ ! -f "$pset_engine_binary" ]; then
            skip_gui_install=yes
        fi
        pset_engine_folder="$temp_dir/$my_arch"
        if [ -f "$temp_dir/$my_arch/install" ]; then 
            pset_engine_cli_binary="$temp_dir/$my_arch/install"
        fi
    fi
}

parse_cmd_parameters()
{
    while [ $# -gt 0 ] ; do
    case "$1" in
    --silent|-s)
        # silent install
        if [ -z "$2" ]; then
            echo "Error: Please provide silent configuration file."
            exit $EXIT_CODE_ERROR
        fi
        if [ ! -e "$2" ]; then
            echo "Error: specified silent configuration file does not exist."
            exit $EXIT_CODE_ERROR
        fi
        exe=`basename $2 2>/dev/null`
        dir=`dirname $2 2>/dev/null`
        if echo $dir | grep -q -s ^/ || echo $dir | grep -q -s ^~ ; then
            # absolute path
            silent_params="--silent $dir/$exe"
            silent_cfg="$dir/$exe"
        else
            # relative path 
            silent_params="--silent $runningdir/$dir/$exe"
            silent_cfg="$runningdir/$dir/$exe"
        fi
        if [ ! -f "$silent_cfg" ]; then
        echo "Error: \"$silent_cfg\" doesn't look like a proper silent configuration file."
            echo "Please make sure that this file exists and run installation again."
            exit $EXIT_CODE_ERROR
        fi
        skip_uid_check="yes"
        shift
        ;;
    --duplicate|-d)
        # duplicate install
        if [ -z "$2" ]; then
            echo "Error: Please provide silent configuration file."
            exit $EXIT_CODE_ERROR
        fi
        exe=`basename $2 2>/dev/null`
        dir=`dirname $2 2>/dev/null`
        if echo $dir | grep -q -s ^/ || echo $dir | grep -q -s ^~ ; then
            # absolute path
            duplicate_params="--duplicate $dir/$exe"
            duplicate_cfg="$dir/$exe"
        else
            # relative path 
            duplicate_params="--duplicate $runningdir/$dir/$exe"
            duplicate_cfg="$runningdir/$dir/$exe"
        fi
        shift    
        ;;
    --help|-h)
        # show help message
        params="$params -h"
        skip_gui_install="yes"
        skip_uid_check="yes"
        skip_cd_eject="yes"
        skip_selinux_check="yes"
        break
        ;;
    --version|-v)
        # show version info
        params="$params --__version__"
        skip_uid_check="yes"
        skip_cd_eject="yes"
        skip_selinux_check="yes"
        break
        ;;
    --lang|-l)
        # user set lang
        user_lang="$2"
        params="$params --LANG=$2"
        shift
        ;;
    --download-url)
        params="$params --download_url '$2'"
        shift
        ;;
    --download-list)
        params="$params --download_list $2 --silent empty"
        silent_params="--silent empty"
        silent_cfg=""
        skip_uid_check="yes"
        shift
        ;;
    --user-mode)
        # run installation under current user privileges
        skip_uid_check="yes"
        ;;
    --ignore-cpu)
        # skip cpu checking
        skip_cpu_check="yes"
        ;;
    --cli-mode)
        # don't start GUI installer
        skip_gui_install="yes"
        cli_mode_params="--cli-mode"
        ;;
    --gui-mode)
        # Start GUI installer even if default is CLI
        skip_gui_install=no
        ;;
    --signature)
        params="$params --signature=$(readlink -f $2)"
        shift
        ;;
    --ignore-signature)
        params="$params --ignore-signature=yes"
        ;;
    --signing-url)
        params="$params --signing-url $2"
        shift
        ;;
    --tmp-dir|-t)
        if [ -z "$2" ]; then
            echo "Error: Please provide temporal folder."
            exit $EXIT_CODE_ERROR
        fi
        user_tmp="$2"
        if [ ! -d "$user_tmp" ]; then
            echo "Error: $user_tmp doesn't look like a proper folder."
            echo "Please make sure that this folder exists and run installation again."
            echo ""
            echo "Quitting!"
            exit $EXIT_CODE_ERROR
        fi

        #params="$params --tmp_dir=$2"
        shift
        ;;
    *)
        params="$params $1"
        #check for LANG option
        is_lang=$(echo $1 | grep "LANG")
        if [ ! -z "$is_lang" ]; then
            user_lang=$(echo $1 | cut -d= -f2)
        fi
        ;;
    esac
    shift
    done
}

check_marker_file()
{
    local pset_marker username is_marker is_process message
    username="$1"
    pset_marker=$user_tmp/intel.pset.$username.running.marker

    is_marker=no
    if [ -f "$pset_marker" ]; then
        is_marker=yes
    fi

    is_process=no
    if pgrep -u $username ^install$ >/dev/null; then
        is_process=yes
    elif pgrep -u $username ^install_gui$ >/dev/null; then
        is_process=yes
    fi

    if [ "yes" = "$is_marker" ]; then
        if [ "yes" = "$is_process" ]; then
            if [ "root" = "$username" ]; then
                [ -z "$LI_bash_pset_root_already_run" ] && get_strings
                echo "$LI_bash_pset_root_already_run"
            else
                [ -z "$LI_bash_pset_already_run" ] && get_strings
                echo "$LI_bash_pset_already_run"
            fi
            exit $EXIT_CODE_ERROR
        fi

        rm -f $pset_marker
    fi
}

create_marker_file()
{
    local pset_marker
    pset_marker=$user_tmp/intel.pset.$USER.running.marker
    touch $pset_marker > /dev/null 2>&1
}

remove_marker_file()
{
    local pset_marker
    pset_marker=$user_tmp/intel.pset.$USER.running.marker
    rm -f $pset_marker > /dev/null 2>&1
}

check_runningdir()
{
    if [ -n "$(echo "$fullpath" | grep " ")" ] ; then
        echo "Error: Incorrect path to installation script. Installation can not be started"
        echo "if the path contains space symbols."
        echo ""
        echo "Quitting!"
        exit $EXIT_CODE_ERROR
    fi

    if [ -n "$(echo "$fullpath" | egrep -e ':' -e '~' -e '&' -e '%' -e '#' -e '@' -e '\[' -e '\]' -e '\$' -e '=' -e '\)' -e '\(' -e '\*')" ] ; then
        echo "Error: Incorrect path to installation script. Installation can not be started"
        echo "if the path contains ':, ~, @, #, %, &, [, ], $, =, ), (, *' symbols."
        echo ""
        echo "Quitting!"
        exit $EXIT_CODE_ERROR
    fi
}

get_strings()
{
    strings_list="bash_root_nonroot;bash_root_nonroot_question;bash_log_as_root;bash_log_as_root_failed;bash_quit;bash_log_as_sudo;bash_log_as_sudo_failed;bash_log_as_user;bash_log_root_nonroot_help;bash_log_quit;bash_log_invalid_choice;to_continue_question;bash_pset_already_run;bash_pset_root_already_run;"
    $pset_engine_cli_binary --tmp_dir=$user_tmp --TEMP_FOLDER=$temp_folder --log_file=$strings_log_file --string_ids="$strings_list" --__get_string__=$strings_file --LANG=$user_lang --PSET_MODE=install
    . $strings_file
    rm $strings_file >/dev/null 2>&1
    rm $strings_log_file >/dev/null 2>&1
}

cli_root_nonroot_dialog()
{
    get_strings
    REPEAT_LOOP=1
    while [ "$REPEAT_LOOP" = 1 ]; do
        echo "$LI_bash_root_nonroot"    
        echo " "
        echo -n "$LI_bash_root_nonroot_question"
        read  usr_choice >/dev/null 2>&1
        if [ -z "$usr_choice" ]; then
            usr_choice=1
        fi
        case $usr_choice in
        1 )
            check_marker_file root
            echo "$LI_bash_log_as_root"
            subcommand="sh $fullpath/$thisexec $silent_params $duplicate_params $cli_mode_params $params --LANG=$user_lang --http_proxy=$http_proxy --https_proxy=$https_proxy || true"
            sh -c "(exec su - -c \"$subcommand\")"
            if [ "$?" = "0" ]; then
                if [ "$old_structure_type" = "no" ]; then
                    rm -rf $temp_dir >/dev/null 2>&1
                fi
                exit $EXIT_CODE_SUCCESS
            else 
                echo -n "$LI_bash_log_as_root_failed"
                read usr_choice >/dev/null 2>&1
                if [ "$usr_choice" = "y" ] || [ -z "$usr_choice" ]; then 
                    REPEAT_LOOP=1
                else
                    echo "$LI_bash_quit"
                    if [ "$old_structure_type" = "no" ]; then
                        rm -rf $temp_dir >/dev/null 2>&1
                    fi
                    exit $EXIT_CODE_SUCCESS
                fi    
            fi
            ;;
        2 )
            check_marker_file root
            echo "$LI_bash_log_as_sudo"
            subcommand="sh $fullpath/$thisexec $silent_params $duplicate_params $cli_mode_params $params --LANG=$user_lang --http_proxy=$http_proxy --https_proxy=$https_proxy || true"
            sh -c "(sudo su - -c \"$subcommand\")"
            if [ "$?" = $EXIT_CODE_SUCCESS ]; then
                if [ "$old_structure_type" = "no" ]; then
                    rm -rf $temp_dir >/dev/null 2>&1
                fi
                exit $EXIT_CODE_SUCCESS
            else
                echo -n "$LI_bash_log_as_sudo_failed"
                read usr_choice >/dev/null 2>&1
                if [ "$usr_choice" = "y" ] || [ -z "$usr_choice" ]; then 
                    REPEAT_LOOP=1
                else
                    echo "$LI_bash_quit"
                    if [ "$old_structure_type" = "no" ]; then
                        rm -rf $temp_dir >/dev/null 2>&1
                    fi
                    exit $EXIT_CODE_SUCCESS
                fi    
            fi
            ;;
        3 )
            echo "$LI_bash_log_as_user"
            REPEAT_LOOP=0
            ;;

        h )
            echo "$LI_bash_log_root_nonroot_help"
            echo -n "$LI_to_continue_question"
            read  dummy >/dev/null 2>&1
            ;;
        q )
            echo "$LI_bash_log_quit"
            if [ "$old_structure_type" = "no" ]; then
                rm -rf $temp_dir >/dev/null 2>&1
            fi
            exit 4
            ;;

        * ) echo "$LI_bash_log_invalid_choice"
            REPEAT_LOOP=1 
            ;;
        esac
    done
}

# script start
thisexec=`basename $0`
thisdir=`dirname $0`
runningdir=`pwd`
[ -z "$HOSTNAME" ] && HOSTNAME=$(hostname);
log_file=intel.pset.$USER.${HOSTNAME}_$(date +%m.%d.%H.%M.%S.%Y).log
old_structure_type="yes"
pset_archive_name="pset.tgz"
strings_file=intel.pset.strings.$USER.${HOSTNAME}
strings_log_file=intel.pset.strings.$USER.${HOSTNAME}.log
require_tmp_space_zip=100
require_tmp_space_org=5
skip_gui_install=yes

trap "" TSTP # Disable Ctrl-Z

# detect bash script source execution
if [ -z "$(echo "$0" | grep "install.sh")" ]; then
    echo "Script is running sourced ..."
    echo "ERROR: This script installs product and should be called directly. Exiting..."
    exit $EXIT_CODE_ERROR
fi

if echo $thisdir | grep -q -s ^/ || echo $thisdir | grep -q -s ^~ ; then
# absolute path
   fullpath="$thisdir"
else
# relative path 
   fullpath="$runningdir/$thisdir"
fi
check_runningdir

system_cpu=`uname -m`
if [ "$system_cpu" = "ia64" ]; then
    my_arch=64
elif [ "$system_cpu" = "x86_64" ]; then
    my_arch=32e
else
    my_arch=32
fi

if [ -f "/sbin/ldconfig" ]; then
    if [ "$my_arch" = "32" ]; then
        libstdc_exist=`/sbin/ldconfig -p | grep libstdc++.so.5 | cut -d'>' -f2`
    elif [ "$my_arch" = "32e" ]; then
        libstdc_exist=`/sbin/ldconfig -p | grep libstdc++.so.5 | grep x86-64 | cut -d'>' -f2`
    else
        libstdc_exist=`/sbin/ldconfig -p | grep libstdc++.so.5 | grep IA-64 | cut -d'>' -f2`
    fi

    libstdc_exist="${libstdc_exist## }"
    libstdc_exist="${libstdc_exist%% }"
    if [ ! -f "$libstdc_exist" ]; then
        libstdc_exist=""
    fi

    if [ "$my_arch" = "32" ]; then
        libz_exist=`/sbin/ldconfig -p | grep libz.so.1 | cut -d'>' -f2`
    elif [ "$my_arch" = "32e" ]; then
        libz_exist=`/sbin/ldconfig -p | grep libz.so.1 | grep x86-64 | cut -d'>' -f2`
    else
        libz_exist=`/sbin/ldconfig -p | grep libz.so.1 | grep IA-64 | cut -d'>' -f2`
    fi

    libz_exist="${libz_exist## }"
    libz_exist="${libz_exist%% }"
    if [ ! -f "$libz_exist" ]; then
        libz_exist=""
    fi
fi

unset libstdc_path
unset libz_path
unset libqt_path

cli_mode_params=""
params=""
parse_cmd_parameters $@

if [ "$skip_cpu_check" != "yes" ]; then
    check_cpu_model
fi

#set log files
if [ -z "$user_tmp" ]; then
    if [ -z "$TMPDIR" ]; then    
        user_tmp="/tmp"
    else
        if [ -d "$TMPDIR" ]; then
            user_tmp=$TMPDIR
        else
            user_tmp="/tmp"
        fi
    fi
fi
touch_space $user_tmp
check=$?
if [ "$check" != "0" ]; then
    if [ "$check" = "1" ]; then
        echo "Error: No write permissions to \"$user_tmp\" temporary folder."
    elif [ "$check" = "2" ]; then
        echo "Error: No execute permissions in \"$user_tmp\" temporary folder."
    fi
    echo "Please fix the permissions or provide another temporary folder."
    echo "To provide another temporary folder please run installation"
    echo "with \"--tmp-dir [FOLDER]\" parameter."
    if [ -z "$silent_params" ]; then
        echo ""
        echo "Quitting!"
    fi
    exit $EXIT_CODE_ERROR
fi

log_file="$user_tmp/$log_file"
strings_file="$user_tmp/$strings_file"
strings_log_file="$user_tmp/$strings_log_file"
#get l10n strings
prepare_pset_binary
if [ -z "$user_lang" ]; then
    if [ ! -z "$LC_CTYPE" ]; then
        user_lang="$LC_CTYPE"
    elif [ ! -z "$LANG"  ]; then
        user_lang="$LANG"
    else
        user_lang="default"
    fi
fi

# check selinux
if [ "$skip_selinux_check" != "yes" ]; then
    SELINUXENABLED_CMD=`which selinuxenabled 2>/dev/null`
    SELINUXGETBOOL_CMD=`which getsebool 2>/dev/null`
    SELINUXSETBOOL_CMD=`which setsebool 2>/dev/null`
    if [ -z "$SELINUXGETBOOL_CMD" ]; then
        if [ -f "/usr/sbin/getsebool" ]; then
            SELINUXGETBOOL_CMD="/usr/sbin/getsebool"
        fi
    fi
    if [ -z "$SELINUXSETBOOL_CMD" ]; then
        if [ -f "/usr/sbin/setsebool" ]; then
            SELINUXSETBOOL_CMD="/usr/sbin/setsebool"
        fi
    fi
    if [ -z "$SELINUXENABLED_CMD" ] ; then
        SELINUX_PATH="/etc/sysconfig/selinux"
        
        if [ -e "$SELINUX_PATH" ] ; then
            SELINUXENABLED="y"
            [ ! -z `cat "$SELINUX_PATH" | grep "SELINUX=disabled"` ] && SELINUXENABLED=""
            [ ! -z `cat "$SELINUX_PATH" | grep "SELINUX=permissive"` ] && SELINUXENABLED=""
        fi
    else
        $SELINUXENABLED_CMD
        [ $? -eq 0 ] && SELINUXENABLED="y"
        if [ -e "$SELINUX_PATH" ] ; then
            [ ! -z `cat "$SELINUX_PATH" | grep "SELINUX=permissive"` ] && SELINUXENABLED=""
        fi
    fi

    if [ "$SELINUXENABLED" = "y" ] ; then
        if [ -z "$SELINUXGETBOOL_CMD" ] || [ -z "$SELINUXSETBOOL_CMD" ]; then
            echo "Your system doesn't allow to determine and change Security-enhanced Linux* (SELinux) settings." \
                 "Please ensure that SELinux utilities 'getsebool' and 'setsebool' are installed on the system" \
                 "and available via PATH variable. Then start installation again."
            echo ""
            echo "Quitting!"
            exit $EXIT_CODE_ERROR  
        fi
    
        if [ "off" = "$( ${SELINUXGETBOOL_CMD} allow_execmod | cut -d' ' -f3)" ] ||
           [ "off" = "$( ${SELINUXGETBOOL_CMD} allow_execstack | cut -d' ' -f3)" ]; then
            echo "Your system is protected with Security-enhanced Linux* (SELinux). " \
                 "Initial product installation and licensing requires that SELinux variables \"allow_execmod\" and \"allow_execstack\" are set to \"on\"." \
                 "In your current set up at least one of these variables is set to \"off\", this may prevent activation of the product."
            echo ""
            echo "You may temporary disable this security setting by calling"
            echo "  setsebool allow_execmod on"
            echo "  setsebool allow_execstack on"
            echo "under root account."
            echo ""
            echo "No reboot will be required."
            echo ""
            echo "More information about SELinux can be found at http://www.nsa.gov/research/selinux/index.shtml"
            echo ""
            if [ -z "$silent_params" ]; then
                echo "Quitting!"
            fi
            exit $EXIT_CODE_ERROR  
        fi
    fi
fi

#create temporary folder
temp_folder=$(mktemp -d -p $user_tmp install.XXXXXX)

#check for valid silent config file
if [ ! -z "$silent_params" ] && [ ! -z "$silent_cfg" ]; then # need to validate silent config file
    awk -f "$fullpath/pset/check.awk" $silent_cfg
    exit_code=$?
    if [ $exit_code != $EXIT_CODE_SUCCESS ]; then
        exit $EXIT_CODE_ERROR
    fi
fi

#add all layers to LD_LIBRARY_PATH
layers_path=""
for layer in $fullpath/pset/*.cab; do
    layer_file=$(basename $layer);
    layer_name=${layer_file%.*};
    layers_path="${layers_path}:${temp_folder}/${layer_name}"
done
export LD_LIBRARY_PATH="${layers_path}:${LD_LIBRARY_PATH}"

#check if started under root account
[ -z "$UID" ] && UID=$(id -ru);
#if yes, no root-nonroot dialog will be shown
[ $UID -eq 0 ] && skip_uid_check=yes

#by default, start GUI engine
if [ "$UID" -ne 0 ] && [ "yes" = "${skip_gui_install}" ] && [ "yes" != "$skip_uid_check" ]; then
    cli_root_nonroot_dialog
fi

if [ "yes" = "${skip_gui_install}" ] || [ -n "${silent_params}" ]; then
    check_marker_file $USER
    create_marker_file
    $pset_engine_cli_binary --tmp_dir=$user_tmp --TEMP_FOLDER=$temp_folder --log_file=$log_file $silent_params $duplicate_params $params --PACKAGE_DIR=$fullpath --PSET_MODE=install
    exit_code=$?
    remove_marker_file
else
    if [ "yes" = "${skip_uid_check}" ]; then
        $pset_engine_binary --tmp_dir=$user_tmp --TEMP_FOLDER=$temp_folder --log_file=$log_file $duplicate_params $params --PACKAGE_DIR=$fullpath --PSET_MODE=install 2>/dev/null
    else
        $pset_engine_binary --tmp_dir=$user_tmp --TEMP_FOLDER=$temp_folder --log_file=$log_file $duplicate_params $params --PACKAGE_DIR=$fullpath --PSET_MODE=install --RUN_MODE=root_nonroot 2>/dev/null
    fi
    exit_code=$?
    if [ $exit_code = $EXIT_CODE_GUI_RUN_ERROR ]; then
        if [ "yes" != "${skip_gui_install}" ]; then
            echo "Cannot run installer in graphical mode."
            echo "Installation will be continued in command-line mode."
            echo ""
        fi

        cli_mode_params="--cli-mode"
        if [ ! -z "$pset_engine_cli_binary" ]; then
            if [ "$UID" -ne 0 ] && [ "yes" != "$skip_uid_check" ]; then
                cli_root_nonroot_dialog
            fi
            check_marker_file $USER
            create_marker_file
            $pset_engine_cli_binary --tmp_dir=$user_tmp --TEMP_FOLDER=$temp_folder --log_file=$log_file $duplicate_params $params --PACKAGE_DIR=$fullpath --PSET_MODE=install
            exit_code=$?
            remove_marker_file
        else
            echo "Please check your system configuration and try again."
        fi
    fi
    cd - >/dev/null 2>&1
fi

rm -rf $temp_dir >/dev/null 2>&1

## CD Eject Issue
if [ -f "$fullpath"/cd_eject.sh ]; then
    if [ -z "$skip_cd_eject" ]; then
        "$fullpath"/cd_eject.sh $PPID
        exit $exit_code
    fi
fi
exit $exit_code
