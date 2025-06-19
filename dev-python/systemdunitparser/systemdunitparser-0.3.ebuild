# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{6..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Systemd Unit Parser"
HOMEPAGE="https://github.com/sgallagher/systemdunitparser"
SRC_URI="mirror://github/sgallagher/systemdunitparser/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
