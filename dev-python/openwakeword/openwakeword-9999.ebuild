# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 git-r3

DESCRIPTION="An open-source audio wake word (or phrase) detection framework with a focus on performance and simplicity."
HOMEPAGE="https://github.com/dscripka/openWakeWord"
EGIT_REPO_URI="https://github.com/dscripka/openWakeWord.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/tqdm[${PYTHON_USEDEP}]
        sci-libs/onnxruntime"
RDEPEND=""
