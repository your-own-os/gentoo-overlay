# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{6..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 git-r3

DESCRIPTION="AKTools is an elegant and simple HTTP API library for AKShare, built for AKSharers!"
HOMEPAGE="https://github.com/akfamily/aktools"
EGIT_REPO_URI="mirror://github/akfamily/aktools.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

src_prepare() {
	default
	rm -r tests
}
