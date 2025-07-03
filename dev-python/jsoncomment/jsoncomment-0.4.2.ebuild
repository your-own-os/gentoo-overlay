# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{6..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="A wrapper to JSON parsers allowing comments, multiline strings and trailing commas"
SRC_URI="https://files.pythonhosted.org/packages/c3/75/b5c7895b8d2edcecbc49b55adb10087183050f95eac33c3453cc12c610f1/jsoncomment-0.4.2.tar.gz"

HOMEPAGE="https://bitbucket.org/Dando_Real_ITA/json-comment"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/json-spec[${PYTHON_USEDEP}]"
RDEPEND=""
