# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{6..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 git-r3

DESCRIPTION="BIOS, Bootloader, Kernel and Initramfs"
HOMEPAGE="https://github.com/fpemud-os/bbki"
EGIT_REPO_URI="https://gitee.com/your-own-os/bbki.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE="device-mapper btrfs bcachefs"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="app-arch/cabextract
         app-arch/cpio
         app-arch/dpkg
         app-arch/rpm2targz
         dev-python/anytree[${PYTHON_USEDEP}]
         dev-python/mrget[${PYTHON_USEDEP}]
         dev-python/psutil[${PYTHON_USEDEP}]
         dev-python/pygit2[${PYTHON_USEDEP}]
         dev-python/sortedcontainers[${PYTHON_USEDEP}]
         dev-python/ordered-set[${PYTHON_USEDEP}]
         dev-python/grub_install[${PYTHON_USEDEP}]
         sys-apps/kmod
         device-mapper? ( sys-fs/lvm2 )
         btrfs? ( sys-fs/btrfs-progs )"

src_prepare() {
        eapply_user
        if ! use device-mapper ; then
                sed -i -e "/HostDiskLvmLv,/d" "${WORKDIR}/${P}/python3/bbki/_po.py"
        fi
        if ! use btrfs ; then
                sed -i -e "/HostDiskBtrfsRaid,/d" "${WORKDIR}/${P}/python3/bbki/_po.py"
        fi
        if ! use bcachefs ; then
                sed -i -e "/HostDiskBcachefsRaid,/d" "${WORKDIR}/${P}/python3/bbki/_po.py"
        fi
}
