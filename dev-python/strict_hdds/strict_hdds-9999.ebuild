# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{6..14} )
DISTUTILS_USE_PEP517=setuptools

inherit linux-info distutils-r1 git-r3

DESCRIPTION="Ensures only some optimized harddisk layouts are used."
HOMEPAGE="https://gitee.com/your-own-os/strict_hdds"
EGIT_REPO_URI="https://gitee.com/your-own-os/strict_hdds.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE="bcachefs btrfs ext4 ntfs xfs device-mapper"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/crcmod
         dev-python/pyparted
         dev-python/pyudev
         dev-python/psutil
         sys-fs/dosfstools
         bcachefs? ( sys-fs/bcachefs-tools )
         btrfs? ( sys-fs/btrfs-progs )
         ext4? ( sys-fs/e2fsprogs )
         ntfs? ( sys-fs/ntfs3g )
         xfs? ( sys-fs/xfsprogs )"

pkg_pretend() {
        local CONFIG_CHECK="~BCACHE ~VFAT_FS"
        use btrfs && CONFIG_CHECK+=" ~BTRFS_FS"
        use ext4 && CONFIG_CHECK+=" ~EXT4_FS"
        use ntfs && CONFIG_CHECK+=" ~NTFS3_FS"
        use xfs && CONFIG_CHECK+=" ~XFS_FS"
        check_extra_config
}

src_prepare() {
        eapply_user
        if ! use bcachefs ; then
                rm -rf ${WORKDIR}/${P}/python3/strict_hdds/layout_*_bcachefs*.py
        fi
        if ! use btrfs ; then
                rm -rf ${WORKDIR}/${P}/python3/strict_hdds/layout_*_btrfs*.py
        fi
        if ! use ext4 ; then
                rm -rf ${WORKDIR}/${P}/python3/strict_hdds/layout_*_ext4*.py
        fi
        if ! use ntfs ; then
                rm -rf ${WORKDIR}/${P}/python3/strict_hdds/layout_*_ntfs*.py
        fi
        if ! use xfs ; then
                rm -rf ${WORKDIR}/${P}/python3/strict_hdds/layout_*_xfs*.py
        fi
}
