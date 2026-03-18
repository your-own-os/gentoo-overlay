# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Python bindings for FluidSynth"
HOMEPAGE="https://github.com/nwhitehead/pyfluidsynth"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	media-sound/fluidsynth
	dev-python/numpy[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND=""
