# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

PYTHON_COMPAT=( python3_{11,13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="A utility for crawling historical and Real-time Quotes data of China stocks"

HOMEPAGE="https://tushare.pro"
LICENSE="BSD"
SRC_URI="https://files.pythonhosted.org/packages/89/09/2141aaccb90a8249edb42d6b31330606d8cf9345237773775a3aa4c71986/${P}.tar.gz"

RESTRICT="test"

SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
RDEPEND="dev-python/pandas[${PYTHON_USEDEP}]
         dev-python/requests[${PYTHON_USEDEP}]
         dev-python/lxml[${PYTHON_USEDEP}]
         dev-python/simplejson[${PYTHON_USEDEP}]
         dev-python/beautifulsoup4[${PYTHON_USEDEP}]
         >=dev-python/websocket-client-0.57.0[${PYTHON_USEDEP}]
         dev-python/tqdm[${PYTHON_USEDEP}]"
