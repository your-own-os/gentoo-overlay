# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{6..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Python library for audio and music analysis"
HOMEPAGE=""
SRC_URI="mirror://github/${PN}/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/decorator[${PYTHON_USEDEP}]
        dev-python/lazy-loader[${PYTHON_USEDEP}]
        dev-python/setuptools[${PYTHON_USEDEP}]
        media-libs/soxr"
RDEPEND=""
