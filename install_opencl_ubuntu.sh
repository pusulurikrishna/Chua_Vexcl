#!/bin/bash -e

# install_intel_cpu.sh: Installs intel's OpenCL runtime.
# Original Authoer: Ruyman Reyes <ruyman@codeplay.com>
# Author: Sean Jones <neuralsandwich@gmail.com>
# Created: 2014-07-18
# Modified: 2014-08-19
# Version: 0.1a
#
# Usage:
#
#    bash ./install.sh

readonly INSTALL_DIR="/opt/intel"
readonly CMD_DEPENDENCIES=(curl alien)
readonly PKG_DEPENDENCIES=(libnuma1 alien)

readonly OPENCL_RUNTIME_NAME="opencl_runtime_14.1_x64_4.4.0.117"
readonly OPENCL_RUNTIME_NAME_DEB="opencl-1.2-4.4.0.117"
readonly OPENCL_RUNTIME_BASE_RPM="opencl-1.2-base-4.4.0.117-1.x86_64"
readonly OPENCL_RUNTIME_CPU_RPM="opencl-1.2-intel-cpu-4.4.0.117-1.x86_64"
readonly OPENCL_RUNTIME_BASE_DEB="opencl-1.2-base_4.4.0.117-2_amd64"
readonly OPENCL_RUNTIME_CPU_DEB="opencl-1.2-intel-cpu_4.4.0.117-2_amd64"
readonly OPENCL_RUNTIME_TGZ="$OPENCL_RUNTIME_NAME.tgz"
readonly DOWNLOAD_URL="http://registrationcenter.intel.com/irc_nas/4181/$OPENCL_RUNTIME_TGZ"

abort () {
    echo "ERROR: $@ "
    exit 1
}

is_dir()
{
    local var=$1

    [[ -d "$var" ]]
}

is_file()
{
    local file=$1

    [[ -f "$file" ]]
}

extract_tar_gz()
{
	local var="$1"

	tar xvf "$var" >> extract-archive.log 2>&1

    if [[ ! -d $OPENCL_RUNTIME_NAME ]]; then
        abort "Could not find $OPENCL_RUNTIME_NAME directory"
    fi
}

convert_rpm_to_deb()
{
	sudo alien "$@" >> rpm-to-deb.log 2>&1
}

install_deb()
{
	sudo dpkg -i "$@" >> install.log 2>&1
}

install_icd()
{
	sudo bash -c "echo -n $INSTALL_DIR/$OPENCL_RUNTIME_NAME_DEB/lib64/libintelocl.so > /etc/OpenCL/vendors/intelocl.icd"
}

check_install()
{
	is_dir "$INSTALL_DIR/$OPENCL_RUNTIME_NAME_DEB/" \
		&& return 0 \
		|| abort " Cannot find the Intel OpenCL SDK after installation. "
}

download_archive()
{
	local link="$1"
	local file="$2"

	if [[ -f "$file" ]];  then
		return 0
	else

		curl -# -O "$link"

		if [[ -z $file ]]; then
			echo "Could not download the Intel OpenCL runtime, please, ensure the link:"
			echo "$opencl_runtime_link"
			echo "works in your browser and try again."
            return 1
		fi
	fi
}

# Checks if the command provided is available.
has_command()
{
    local cmd=$1

    if [[ ! -z $(command -v "$cmd") ]]; then
        return 0
    else
        return 1
    fi
}

# Checks if the command provided is available.
has_package()
{
    local pkg=$1

    if [[ $(dpkg -s "$pkg" | grep Status: | sed 's/Status: install //' | sed 's/ installed//') == 'ok' ]]; then
        return 0
    else
        return 1
    fi
}

# Check the environment has the commands provided to it.
# Takes the commands in an array - i.e. $DEPENDENCIES.
correct_environment()
{
    for cmd in ${CMD_DEPENDENCIES[*]}
    do
        (has_command $cmd) || return 1
    done

    for pkg in ${PKG_DEPENDENCIES[*]}
    do
        (has_package $pkg) || return 1
    done

    return 0
}

# Checks for the presences of the installtion directory
already_installed()
{
    is_dir "$INSTALL_DIR/$OPENCL_RUNTIME_NAME_DEB/" \
        && return 0 \
        || return 1
}

install()
{
    # Show warning message.
    clear
    echo -e '\nThis script is about to install the Intel OpenCL SDK on Ubuntu 14.04.'
    echo -e "Be prepared to enter your password during the execution of the script as it"
    echo -e "requires superuser privileges.\n"
    echo    "**********************************************************************"
    echo    "**** Be sure to uninstall any previous Intel OpenCL driver.       ****"
    echo    "**** Although normally the debian package will solve any problems ****"
    echo    "**** it is better to be safe than sorry.                          ****"
    echo -e "**********************************************************************\n"

    sleep 2

    cd "/tmp"

    case $(download_archive "$DOWNLOAD_URL" "$OPENCL_RUNTIME_TGZ") in
        1)
            echo "OpenCL archive already exists"
            ;;
        2)
            echo "Could not download OpenCL archive"
            ;;
        *)
            ;;
    esac

	extract_tar_gz $OPENCL_RUNTIME_NAME.tgz
	cd "$OPENCL_RUNTIME_NAME"

    # Convert the rpm from the archive to deb files
    convert_rpm_to_deb "$OPENCL_RUNTIME_BASE_RPM.rpm" "$OPENCL_RUNTIME_CPU_RPM.rpm"

    # Check for the converted debian packages
    if [[ -d "$OPENCL_RUNTIME_BASE.deb" ]] && [[ -d "$OPENCL_RUNTIME_CPU.deb" ]]; then
        abort "Could not find the debian packages for installation"
    fi

	install_deb "$OPENCL_RUNTIME_BASE_DEB.deb" "$OPENCL_RUNTIME_CPU_DEB.deb"

    # create icd in /etc/OpenCL/vendors pointing to intelocl.icd
	sudo mkdir -p /etc/OpenCL/vendors
	if [[ $(ls /etc/OpenCL/vendors/ | wc -l) -gt 0 ]];
	then
		echo -e "\nThere are ICD files in the /etc/OpenCL/vendors directory.";
		echo    "Be aware that any existing Intel OpenCL ICD file will be removed.";
        echo    "Interupt (CTRL-C) now to cancel overwriting these files."
        sleep 2
	fi
	echo "Creating the icd file"
	install_icd
}

# Checks the init script is installed correctly and restarts the daemon.
finish()
{
    if [[ check_install -eq 0 ]]; then
        rm -rf "/tmp/$OPENCL_RUNTIME_NAME"
        rm -rf "/tmp/$OPENCL_RUNTIME_TGZ"
        cd "$HOME"
	    echo "Installation complete."
    else
        abort "Installation failed, cannot find install directory"
    fi
}

# Checks the environment for needed dependencies, installes the daemon and
# does any clean up or restarts as needed in finish().
main()
{
    if correct_environment; then
        if already_installed; then
            abort "Already installed"
        else
            install
        fi
        finish
        exit 0
    fi

    echo "ERROR: Installation dependencies not met"
    echo "Please install the following commands and packages:"
    echo "Packages: ${PKG_DEPENDENCIES[*]}"
    echo "Commands: ${CMD_DEPENDENCIES[*]}"
    exit 1
}

# Run main, everthing executes from there.
main
