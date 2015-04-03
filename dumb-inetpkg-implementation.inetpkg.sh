#!/bin/sh

### Package information ###

## The following data is not subject to copyright
## protection in any sensible jurisdiction, in case
## it happens to be subject to copyright protection
## it is hence licensed under GNU All-Permissive License:
## 
## Copying and distribution of this file, with or without modification,
## are permitted in any medium without royalty provided the copyright
## notice and this notice are preserved.  This file is offered as-is,
## without any warranty.


# Package identifier, generated with `uuidgen -t`.
# `uuidgen -t` generates a time-based UUID based
# on the system clock and the system's ethernet
# hardware address (included verbatim), so it is
# absolutely universally unique and there can be
# no collisions.
UUID=01f31e26-8150-11e4-b2d7-001fc6eb6c2e
export UUID

# This function is used to print information
# about the package. The package maintainer
# may choose any format for the output. This
# is not intended to be parsed by programs.
print_information() {
    cat <<EOF
License: GNU All-Permissive License
Package name: dumb-inetpkg-implementation
Package version: 1

Description:
  Dumb reference implementation for the inetpkg tool
  for the inetpkg package system which aims to provide
  stupid-simple distro-agnostic packaging.

Optional dependencies:
  (none)

Package identifier: ${UUID}
Package maintainer: Mattias Andrée <maandree@member.fsf.org>
Upstream site: http://github.com/maandree/inetpkg
Package version status: draft
EOF
}

# This function lists the UUID:s of packages
# that are required to download and unpack
# the package. The first columns are the
# UUID:s, it is optionally followed by a
# regular blank space and any comments, such
# as package name, version and source.
# If a package is required during building it
# must be listed here even if it is required
# in any of the other stages.
list_fetch_dependencies() {
    cat <<EOF
EOF
}

# This function lists the UUID:s of packages
# that are required to built the package.
# The first columns are the UUID:s, it is
# optionally followed by a regular blank space
# and any comments, such as package name,
# version and source.
# If a package is required during building it
# must be listed here even if it is required
# in any of the other stages.
list_build_dependencies() {
    cat <<EOF
EOF
}

# This function lists the UUID:s of packages
# that are required to install the package.
# The first columns are the UUID:s, it is
# optionally followed by a regular blank space
# and any comments, such as package name,
# version and source.
# If a package is required during installation
# it must be listed here even if it is required
# in any of the other stages.
list_install_dependencies() {
    cat <<EOF
EOF
}

# This function lists the UUID:s of packages
# that are required to run the package.
# The first columns are the UUID:s, it is
# optionally followed by a regular blank space
# and any comments, such as package name,
# version and source.
# If a package is required during runtime it
# must be listed here even if it is required
# in any of the other stages.
list_runtime_dependencies() {
    cat <<EOF
EOF
}

# This function lists the UUID:s of packages
# that are required to uninstall the package
# properly. The first columns are the UUID:s,
# it is optionally followed by a regular blank
# space and any comments, such as package name,
# version and source.
# If a package is required during uninstallation
# it must be listed here even if it is required
# in any of the other stages.
list_uninstall_dependencies() {
    cat <<EOF
EOF
}

# This function lists files that may have been
# created by the package during runtime.
# If the package creates directories they
# may only be listed if those directories are
# exclusive to the package. For example,
# if ${HOME}/.config/my-package/ is created,
# ${HOME}/.config/my-package/ should be listed
# but ${HOME}/.config/ must not be listed.
list_user_files() {
    cat <<EOF
${HOME}/.local/var/lib/inetpkg/
EOF
}

# This function downloads the files required
# to build and unintall the package, and then
# unpacks them.
fetch_package() {
    true
}

# This function builds the package.
build_package() {
    true
}

# This function installs the package.
install_package() {
    true
}

# This function makes adjustments to
# files other packages for the installation
# of this package, for example update
# the documentation index.
postinstall_package() {
    true
}

# This function undos `install_package`.
uninstall_package() {
    true
}

# This function undos `postinstall_package`.
postuninstall_package() {
    true
}

# Note that `list_fetch_dependencies` and `fetch_package`
# is called both att installation and uninstallation.
# You can check $INSTALL and $UNINSTALL to find out
# what is happending and adapt the fetch for that.



### Standard .inetpkg.sh code that packages share ###

## Unfortunately the following code *is* subject to
## copyright protection. It is licensed under GNU
## All-Permissive License:
## 
## Copyright (C) 2014, 2015  Mattias Andrée <maandree@member.fsf.org>
## 
## Copying and distribution of this file, with or without modification,
## are permitted in any medium without royalty provided the copyright
## notice and this notice are preserved.  This file is offered as-is,
## without any warranty.


# Ignore the following if `inetpkg-native` is running.
# ${INETPKG_NATIVE_STATUS} is set to "ignore" before
# `inetpkg-native` is executed. This is so that
# `inetpkg-native` can take the information is the first
# section of .inetpkg.sh-file. However, `inetpkg-native`
# may change the value to "running", if this is done,
# the .inetpkg.sh-file is used to install under
# `inetpkg-native` assistance and supervision.
if [ ! "${INETPKG_NATIVE_STATUS}" = "ignore" ]; then
    
    # Make the script exit if it fails.
    set -e
    
    # Check for fundamental dependencies.
    MISSED_DEPS=0
    if ! hash cat 2>/dev/null >/dev/null; then
	echo "You need the program 'cat' to use this package file," >&2
	echo "try to install the 'GNU core utilties' package (coreutils)" >&2
	echo "with your system's package manager or download it from" >&2
	echo "https://www.gnu.org/software/coreutils" >&2
	echo >&2
	MISSED_DEPS=1
    fi
    if ! hash realpath 2>/dev/null >/dev/null; then
	echo "You need the program 'realpath' to use this package file," >&2
	echo "try to install the 'GNU core utilties' package (coreutils)" >&2
	echo "with your system's package manager or download it from" >&2
	echo "https://www.gnu.org/software/coreutils" >&2
	echo >&2
	MISSED_DEPS=1
    fi
    if ! hash mkdir 2>/dev/null >/dev/null; then
	echo "You need the program 'mkdir' to use this package file," >&2
	echo "try to install the 'GNU core utilties' package (coreutils)" >&2
	echo "with your system's package manager or download it from" >&2
	echo "https://www.gnu.org/software/coreutils" >&2
	echo >&2
	MISSED_DEPS=1
    fi
    if [ ${MISSED_DEPS} = 1 ]; then
	exit 2
    fi
    
    # Store the pathname of this file, this because
    # we do want any troubles with `inetpkg-native`.
    # Technically it could be handled in `inetpkg-native`
    # but lets make it simple for them.
    if [ -z "${INETPKG_PACKAGE_FILE}" ]; then
	export INETPKG_PACKAGE_FILE="$(realpath -- "${0}")"
    fi
    
    # `inetpkg` is a basic program distributions
    # should provide, ideally of their own version.
    # `inetpkg` is primarily used for dependency
    # resolution, which is the only mandatory feature,
    # and the only one .inetpkg.sh-files use during
    # installation. However, .inetpkg.sh-files not
    # require `inetpkg` to function.
    HAVE_INETPKG=0
    if hash inetpkg 2>/dev/null >/dev/null; then
	HAVE_INETPKG=1
    fi
    
    # `inetpkg-native` is program distributions
    # may choose to provide. Its purpose is to
    # enable the system package manager to
    # maintain the package rather than having it
    # unmaintained. This requires that the
    # distribution's package manager supports
    # user-private packages.
    if [ ! "${INETPKG_NATIVE_STATUS}" = "running" ]; then
	if hash inetpkg-native 2>/dev/null >/dev/null; then
	    export INETPKG_NATIVE_STATUS="ignore"
	    exec inetpkg-native "$0" "$@"
	    exit 1
	fi
    fi
    
    # Parse the command line arguments so
    # we know what to do.
    CLEAN=0
    UNINSTALL=0
    INSTALL=0
    TIDY=0
    INFORMATION=0
    HELP=0
    ROOT="${HOME}/.local"
    DESTDIR=
    for arg in "$@"; do
	if [ "${arg}" = "--clean" ]; then
	    # This is used to remove files created during runtime,
	    # it can be used to reset the package's configuration
	    # and state files, or to remove then during or after
	    # uninstallation.
	    CLEAN=1
	elif [ "${arg}" = "--uninstall" ]; then
	    # Obviously this is used to uninstall the package.
	    UNINSTALL=1
	elif [ "${arg}" = "--install" ]; then
	    # Obviously this is used to install the package.
	    INSTALL=1
	elif [ "${arg}" = "--tidy" ]; then
	    # This is used to remove fetch, build and install dependencies
	    # when they are no longer needed.
	    if [ ${HAVE_INETPKG} = 0 ]; then
		echo "Ignoring argument: --tidy, requires inetpkg" >&2
		exit 2
	    else
		TIDY=0
	    fi
	elif [ "${arg}" = "--help" ]; then
	    # Obviously this is used to get some help about what to do.
	    HELP=1
	elif [ "${arg}" = "--info" ]; then
	    # This is used to print informaton about the package.
	    INFORMATION=1
	elif [ "${arg::7}" = "--root=" ]; then
	    # This is used to select another root directory than ~/.local/.
	    ROOT="$(realpath -- "${arg:7}")"
	elif [ "${arg::10}" = "--destdir=" ]; then
	    # Like $(DESTDIR) in Makefiles, this is used to select where
	    # the package should be installed temporarily before it is
	    # move into its proper location.
	    DESTDIR="$(realpath -- "${arg:10}")"
	    if [ ! "${INETPKG_NATIVE_STATUS}" = "running" ]; then
		echo "Warning: --destdir is used without inetpkg-native," \
		     "wou will need to move the files to / manually" >&2
	    fi
	else
	    echo "Unrecognised argument: ${arg}" >&2
	    exit 2
	fi
    done
    
    # Test command line sanity.
    if [ ${CLEAN} = 1 ] && [ ${INSTALL} = 1 ]; then
	echo "Cannot combine arguments: --clean, --install" >&2
	exit 2
    fi
    if [ ${CLEAN} = 1 ] && [ ${TIDY} = 1 ]; then
	echo "Cannot combine arguments: --clean, --tidy" >&2
	exit 2
    fi
    if [ ${INFORMATION} = 1 ] && [ ${INSTALL} = 1 ]; then
	echo "Cannot combine arguments: --info, --install" >&2
	exit 2
    fi
    if [ ${INFORMATION} = 1 ] && [ ${CLEAN} = 1 ]; then
	echo "Cannot combine arguments: --info, --clean" >&2
	exit 2
    fi
    if [ ${INFORMATION} = 1 ] && [ ${TIDY} = 1 ]; then
	echo "Cannot combine arguments: --info, --tidy" >&2
	exit 2
    fi
    if [ ${INSTALL} = 1 ] && [ ${UNINSTALL} = 1 ]; then
	echo "Cannot combine arguments: --install, --uninstall" >&2
	exit 2
    fi
    if [ ${UNINSTALL} = 1 ] && [ ${TIDY} = 1 ]; then
	echo "Cannot combine arguments: --uninstall, --tidy" >&2
	exit 2
    fi
    
    # Make options reachable to all programs and functions.
    export ROOT="${ROOT}"
    export DESTDIR="${DESTDIR}"
    
    
    # Act upon --help.
    if [ ${HELP} = 1 ]; then
	cat <<EOF
SYNOPSIS:  ${0} [options...]

OPTIONS:   --install    Install the package. (default)
           --tidy       During installation remove temporary dependencies
                        when they are no longer required.
           --clean      Clean up files created by the package at runtime.
           --uninstall  Uninstall the pacakge.
           --info       Print information about the package.
           --help       Print this message.
EOF
	exit 0
    fi
    
    # Act upon --info.
    if [ ${INFORMATION} = 1 ]; then
	print_information
	exit 0
    fi
    
    # Act upon --clean.
    if [ ${CLEAN} = 1 ]; then
	# Check for fundamental dependencies.
	MISSED_DEPS=0
	if ! hash rm 2>/dev/null >/dev/null; then
	    echo "You need the program 'rm' to use the --clean option," >&2
	    echo "try to install the 'GNU core utilties' package (coreutils)" >&2
	    echo "with your system's package manager or download it from" >&2
	    echo "https://www.gnu.org/software/coreutils" >&2
	    echo >&2
	    MISSED_DEPS=1
	fi
	if ! hash xargs 2>/dev/null >/dev/null; then
	    echo "You need the program 'xargs' to use the --clean option," >&2
	    echo "try to install the 'GNU find utilties' package (findutils)" >&2
	    echo "with your system's package manager or download it from" >&2
	    echo "https://www.gnu.org/software/findutils" >&2
	    echo >&2
	    MISSED_DEPS=1
	fi
	if [ ${MISSED_DEPS} = 1 ]; then
	    exit 2
	fi
	# Commence cleaning.
	list_user_files | xargs rm -r -- || true
	if [ ${UNINSTALL} = 0 ]; then
	    exit 0
	fi
    fi
    
    
    # If we do not have a `inetpkg` we will create a
    # really stupid one.
    if [ ${HAVE_INETPKG} = 0 ]; then
	# Check for fundamental dependencies.
	MISSED_DEPS=0
	if ! hash cut 2>/dev/null >/dev/null; then
	    echo "You need the program 'cut' to use this package file," >&2
	    echo "try to install the 'GNU core utilties' package (coreutils)" >&2
	    echo "with your system's package manager or download it from" >&2
	    echo "https://www.gnu.org/software/coreutils" >&2
	    echo >&2
	    MISSED_DEPS=1
	fi
	if [ ${MISSED_DEPS} = 1 ]; then
	    exit 2
	fi
	inetpkg() {
	    # This implementation will test that the dependencies are
	    # installed when --check-dependencies is used, rather than
	    # checking if there is a way to install them if they are
	    # not already installed. Because of this, this implementation
	    # also ignores all other flags.
	    r=0
	    if [ ! "${1}" = "--check-dependencies"  ]; then
		cat >/dev/null
		return
	    fi
	    while read -r dependency; do
		dep="$(echo "${dependency}" | cut -d ' ' -f 1)"
		if [ ! -f "${ROOT}/var/lib/inetpkg/installed/${dep}" ]; then
		   r=1
		   echo "Missing dependency: ${dependency}" >&2
		fi
	    done
	    return ${r}
	}
    fi
    
    
    # Create working directory.
    if [ -e "/tmp/inetpkg.${UUID}" ]; then
	echo "/tmp/inetpkg.${UUID} already exists, I am stymied." >&2
	exit 2
    fi
    mkdir -p "/tmp/inetpkg.${UUID}"
    cd "/tmp/inetpkg.${UUID}"
    remove_working_directory ()
    {
	cd /
	if ! hash rm 2>/dev/null >/dev/null; then
	    echo "'rm' is not installed, you will have to remove /tmp/inetpkg.${UUID} manually"
	elif ! rm -r "/tmp/inetpkg.${UUID}"; then
	    echo "Failed to remove /tmp/inetpkg.${UUID}, you will have to do it manually"
	fi
    }
    
    
    # Act upon --uninstall.
    if [ ${UNINSTALL} = 1 ]; then
	# Check that dependencies can be installed.
	echo "Checking for fetch dependencies..." >&2
	list_fetch_dependencies | inetpkg --check-dependencies
	echo "Checking for uninstall dependencies..." >&2
	list_uninstall_dependencies | inetpkg --check-dependencies
	
	# Fetch package sources for uinstallation.
	echo "Installing fetch dependencies..." >&2
	list_fetch_dependencies | inetpkg --install-dependencies --package="${UUID}"
	echo "Fetching package..." >&2
	fetch_package
	echo "Uninstalling fetch dependencies..." >&2
	list_fetch_dependencies | inetpkg --uninstall-dependencies --package="${UUID}"
	
	# Uninstall package.
	echo "Installing uninstall dependencies..." >&2
	list_uninstall_dependencies | inetpkg --install-dependencies --package="${UUID}"
	echo "Uinstalling package..." >&2
	set +e
	uninstall_package
	postuninstall_package
	set -e
	echo "Uninstalling uninstall dependencies..." >&2
	list_uninstall_dependencies | inetpkg --uninstall-dependencies --package="${UUID}"
	
	# Remove files created during fetching.
	remove_working_directory || true
	
	# Profit
	echo "Done!" >&2
	exit 0
    fi
    
    
    # Create the directory for installed packages.
    if [ ! -d "${ROOT}/var/lib/inetpkg/installed" ]; then
	mkdir -p -- "${ROOT}/var/lib/inetpkg/installed"
    fi
    
    
    # Act upon (possibly implicit) --install.
    
    # Check that dependencies can be installed.
    echo "Checking for fetch dependencies..." >&2
    list_fetch_dependencies | inetpkg --check-dependencies
    echo "Checking for build dependencies..." >&2
    list_build_dependencies | inetpkg --check-dependencies
    echo "Checking for install dependencies..." >&2
    list_install_dependencies | inetpkg --check-dependencies
    echo "Checking for runtime dependencies..." >&2
    list_runtime_dependencies | inetpkg --check-dependencies
    
    # Fetch package binaries or sources.
    echo "Installing fetch dependencies..." >&2
    list_fetch_dependencies | inetpkg --install-dependencies --package="${UUID}"
    echo "Fetching package..." >&2
    fetch_package
    if [ ${TIDY} = 1 ]; then
	echo "Uninstalling fetch dependencies..." >&2
	list_fetch_dependencies | inetpkg --uninstall-dependencies --package="${UUID}"
    fi
    
    # Build package.
    echo "Installing build dependencies..." >&2
    list_build_dependencies | inetpkg --install-dependencies --package="${UUID}"
    echo "Building package..." >&2
    build_package
    if [ ${TIDY} = 1 ]; then
	echo "Uninstalling build dependencies..." >&2
	list_build_dependencies | inetpkg --uninstall-dependencies --package="${UUID}"
    fi
    
    # Install package.
    echo "Installing install dependencies..." >&2
    list_install_dependencies | inetpkg --install-dependencies --package="${UUID}"
    echo "Install package..." >&2
    install_package
    postinstall_package
    if [ ${TIDY} = 1 ]; then
	echo "Uninstalling install dependencies..." >&2
	list_install_dependencies | inetpkg --uninstall-dependencies --package="${UUID}"
    fi
    
    # Install runtime dependencies.
    echo "Installing runtime dependencies..." >&2
    list_runtime_dependencies | inetpkg --install-dependencies --package="${UUID}"
    
    # Save this file and in doing so mark it as installed.
    cp -- "${INETPKG_PACKAGE_FILE}" "${ROOT}/var/lib/inetpkg/installed/${UUID}"
    
    # Remove files created during fetching and building.
    remove_working_directory || true
    
    # Profit!
    echo "Done!" >&2
    
fi

