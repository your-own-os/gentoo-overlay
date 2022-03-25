# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit git-r3

DESCRIPTION="System manager for Fpemud OS"
SRC_URI=""
EGIT_REPO_URI="https://gitee.com/fpemud-os/sysman"

KEYWORDS="x86 amd64"
LICENSE="GPL-3"
SLOT="0"
IUSE="os-prober"

RDEPEND="sys-apps/systemd
         app-admin/gentoo-bashrc
         app-portage/gentoolkit
         net-misc/stunnel
         net-misc/wget
         sys-apps/portage
         dev-util/patchutils
         dev-vcs/git
         dev-vcs/subversion
         sys-boot/grub[grub_platforms_pc,grub_platforms_efi-64,nls,fonts,themes]
         sys-fs/squashfs-tools
         net-fs/httpdirfs
         >=sys-fs/dosfstools-4.0-r1
         sys-apps/smartmontools
         sys-apps/dmidecode
         app-arch/xz-utils
         app-arch/zip
         sys-libs/tdb
         dev-python/asyncio-pool
         dev-python/bbki[btrfs]
         dev-python/blessed
         dev-python/gstage4
         dev-python/lxml
         dev-python/ntplib
         dev-python/passlib
         dev-python/pygobject
         dev-python/pyopenssl
         dev-python/pyudev
         dev-python/strict_fsh
         dev-python/strict_hdds[btrfs]
         dev-python/strict_pgs
         dev-python/pyparted
         dev-python/requests
         dev-python/robust_layer
         dev-python/wstage4
         dev-perl/Digest-SHA1
         dev-perl/Proc-ProcessTable"

# dependencies for building linux kernel
RDEPEND="${RDEPEND}
         sys-devel/bc"

# dependencies for auxillary os detection
RDEPEND="${RDEPEND}
         os-prober? ( sys-boot/os-prober )"

DEPEND="${RDEPEND}
        virtual/pkgconfig"

src_prepare() {
	eapply_user
	if ! use os-prober ; then
		sed -i -e "s/supportOsProber = .*/supportOsProber = False/g" "${WORKDIR}/${P}/lib/fm_param.py"
	fi
}

pkg_extra_files() {
	echo "/var/cache/bbki/***"
	echo "/var/lib/bbki/***"

	echo "/var/cache/portage/***"
	echo "/var/lib/portage/***"
}
