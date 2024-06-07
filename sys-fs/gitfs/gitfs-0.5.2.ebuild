# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..12} )
inherit distutils-r1

DESCRIPTION="Version controlled file system"
HOMEPAGE="https://www.presslabs.com/code/gitfs/"
SRC_URI="https://github.com/presslabs/gitfs/archive/refs/tags/${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
