# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{6..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Python m3u8 parser"
HOMEPAGE="https://github.com/globocom/m3u8/"
SRC_URI="https://files.pythonhosted.org/packages/0a/c1/ea98c5f109be04a745d01437f77b801192f3cf56cb834fa5e660f0a0ce03/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
