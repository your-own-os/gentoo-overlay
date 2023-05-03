# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python{3_9,3_10,3_11} )

inherit distutils-r1 git-r3

DESCRIPTION="Ensures only some optimized harddisk layouts are used."
HOMEPAGE="https://gitee.com/your-own-os/strict_hdds"
EGIT_REPO_URI="https://gitee.com/your-own-os/strict_hdds.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE="bcachefs btrfs device-mapper"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/crcmod
         dev-python/pyparted
         dev-python/psutil
         sys-fs/dosfstools
         bcachefs? ( sys-fs/bcachefs-tools )
         btrfs? ( sys-fs/btrfs-progs )
         device-mapper? ( sys-fs/lvm2 )"

src_prepare() {
        eapply_user
        if ! use bcachefs ; then
                rm -rf ${WORKDIR}/${P}/python3/strict_hdds/layout_*_bcachefs*.py
        fi
        if ! use btrfs ; then
                rm -rf ${WORKDIR}/${P}/python3/strict_hdds/layout_*_btrfs*.py
        fi
        if ! use device-mapper ; then
                rm -rf ${WORKDIR}/${P}/python3/strict_hdds/layout_*_lvm_*.py
        fi
}
