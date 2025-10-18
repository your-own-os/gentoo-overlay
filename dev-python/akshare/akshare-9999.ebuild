# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{6..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 git-r3

DESCRIPTION="AKShare is an elegant and simple financial data interface library for Python, built for human beings!"
HOMEPAGE="https://github.com/akfamily/akshare"
EGIT_REPO_URI="mirror://github/akfamily/akshare.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

#        >=dev-python/akracer-0.0.13
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        >=dev-python/aiohttp-3.11.13
        >=dev-python/beautifulsoup4-4.9.1
        >=dev-python/lxml-4.2.1
        >=dev-python/pandas-0.25
        >=dev-python/requests-2.22.0
        >=dev-python/html5lib-1.0.1
        >=dev-python/xlrd-1.2.0
        >=dev-python/urllib3-1.25.8
        >=dev-python/tqdm-4.43.0
        >=dev-python/openpyxl-3.0.3
        >=dev-python/jsonpath-0.82
        >=dev-python/tabulate-0.8.6
        >=dev-python/decorator-4.4.2
        >=dev-python/nest-asyncio-1.6.0
        >=dev-python/mini-racer-0.6.0"
RDEPEND=""

src_prepare() {
	default
	rm -r tests
}
