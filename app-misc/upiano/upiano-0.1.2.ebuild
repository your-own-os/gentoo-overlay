# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1

DESCRIPTION="A Piano in your terminal"
HOMEPAGE="https://github.com/eliasdorneles/upiano"
SRC_URI="mirror://github/eliasdorneles/upiano/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/pyfluidsynth[${PYTHON_USEDEP}]
         dev-python/textual[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
BDEPEND=""
