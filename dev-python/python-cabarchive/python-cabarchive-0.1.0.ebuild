# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..12} )
inherit distutils-r1

DESCRIPTION="A pure-python library for creating and extracting cab files"
HOMEPAGE="https://github.com/hughsie/python-cabarchive/"
SRC_URI="mirror://github/hughsie/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND=""
BDEPEND=""
