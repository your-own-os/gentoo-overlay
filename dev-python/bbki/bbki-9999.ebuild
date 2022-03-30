# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
PYTHON_COMPAT=( python{3_8,3_9,3_10} )

inherit distutils-r1 git-r3

DESCRIPTION="BIOS, Bootloader, Kernel and Initramfs"
HOMEPAGE="https://github.com/fpemud-os/bbki"
EGIT_REPO_URI="https://gitee.com/your-own-os/bbki.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE="device-mapper btrfs bcachefs"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="app-arch/cpio
         dev-python/psutil
         dev-python/pylkc
         dev-python/anytree
         dev-python/ordered-set
         dev-python/grub_install
         sys-apps/kmod[python]
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
