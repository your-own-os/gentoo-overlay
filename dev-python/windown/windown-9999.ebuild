# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
PYTHON_COMPAT=( python{3_6,3_7,3_8,3_9} )

inherit distutils-r1 git-r3

DESCRIPTION="Python module and tools for downloading microsoft windows install files, and other microsoft products."
HOMEPAGE=""
EGIT_REPO_URI="https://gitee.com/your-own-os/windown.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="net-libs/wpewebkit
         dev-python/selenium"
