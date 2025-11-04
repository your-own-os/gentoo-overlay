# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{6..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 git-r3

DESCRIPTION="Some miscellaneous processing for playing games."
HOMEPAGE=""
EGIT_REPO_URI="https://gitee.com/your-own-os/librungame.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="dev-python/bidict[${PYTHON_USEDEP}]
         dev-python/setuptools[${PYTHON_USEDEP}]
         dev-python/screeninfo[${PYTHON_USEDEP}]
         dev-python/wineprefix[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
