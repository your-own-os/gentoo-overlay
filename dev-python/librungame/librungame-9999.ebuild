# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
PYTHON_COMPAT=( python{3_8,3_9,3_10} )

inherit distutils-r1 git-r3

DESCRIPTION="Some miscellaneous processing for playing games."
HOMEPAGE=""
EGIT_REPO_URI="https://gitee.com/your-own-os/librungame.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/screeninfo
        dev-python/pyamdgpuinfo
        sys-fs/fuse-overlayfs"
RDEPEND=""
