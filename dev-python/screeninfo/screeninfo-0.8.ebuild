# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
DISTUTILS_USE_SETUPTOOLS=pyproject.toml
inherit distutils-r1

DESCRIPTION="Fetch location and size of physical screens"
HOMEPAGE="https://github.com/rr-/screeninfo"
SRC_URI="https://github.com/rr-/screeninfo/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}"

#python_install_all() {
#	distutils-r1_python_install_all
#	rm "${ED}"/usr/LICENSE || die 'Can’t remove LICENSE file'
#}
