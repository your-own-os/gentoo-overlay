# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

PYTHON_COMPAT=( python3_{6..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="DeepSeek API Library"
HOMEPAGE="https://github.com/deskpai/deepseek"
SRC_URI="mirror://github/deskpai/deepseek/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Unknown"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
