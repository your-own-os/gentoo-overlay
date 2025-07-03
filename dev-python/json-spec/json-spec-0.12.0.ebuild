# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{6..13} )
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1

DESCRIPTION="Implements some tools for JSON"
SRC_URI="https://files.pythonhosted.org/packages/4d/47/84e030fb7764bd716d2fb58d4bd45c006b407cd413f472a60f1e09265ceb/json_spec-0.12.0.tar.gz"

HOMEPAGE="http://py.errorist.io/json-spec"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/json_spec-${PV}"
