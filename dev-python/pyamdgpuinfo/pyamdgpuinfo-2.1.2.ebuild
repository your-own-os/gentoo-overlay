# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{6..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="AMD GPU stats"
HOMEPAGE="https://github.com/mark9064/pyamdgpuinfo"
SRC_URI="mirror://github/mark9064/pyamdgpuinfo/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}"
