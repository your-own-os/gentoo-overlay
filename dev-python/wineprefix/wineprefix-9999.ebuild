# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{6..13} )
ISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 git-r3

DESCRIPTION="Python module for manipulating a WINEPREFIX for wine."
HOMEPAGE=""
EGIT_REPO_URI="https://gitee.com/your-own-os/wineprefix.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/psutil[${PYTHON_USEDEP}]
        dev-python/xvfbwrapper[${PYTHON_USEDEP}]"
RDEPEND=""
