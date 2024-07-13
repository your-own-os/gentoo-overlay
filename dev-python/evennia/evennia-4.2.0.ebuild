# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..12} )
inherit distutils-r1

DESCRIPTION="Python MUD/MUX/MUSH/MU* development system"
HOMEPAGE="https://github.com/evennia/evennia"
SRC_URI="https://github.com/evennia/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="unknown"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
BDEPEND=""
