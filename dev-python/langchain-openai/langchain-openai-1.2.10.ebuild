# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="Building applications with LLMs through composability"

HOMEPAGE="https://github.com/langchain-ai/langchain"
LICENSE="BSD"
SRC_URI="mirror://github/langchain-ai/langchain/archive/refs/tags/langchain==${PV}.tar.gz"

RESTRICT="test"

SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
RDEPEND=""

S="${WORKDIR}/langchain-langchain-${PV}/libs/partners/openai"
