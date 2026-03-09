# Copyright 1999-2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="A lightweight personal AI assistant framework"
HOMEPAGE="https://github.com/HKUDS/nanobot"
SRC_URI="mirror://github/HKUDS/nanobot/archive/refs/tags/v0.1.4.post4.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=dev-python/croniter-6.0.0
	>=dev-python/httpx-0.28.0
	>=dev-python/litellm-1.81.5
	>=dev-python/loguru-0.7.3
	>=dev-python/pydantic-2.12.0
	>=dev-python/pydantic-settings-2.12.0
	>=dev-python/python-telegram-bot-22.0
	>=dev-python/readability-lxml-0.8.4
	>=dev-python/rich-14.0.0
	>=dev-python/typer-0.20.0
	>=dev-python/websocket-client-1.9.0
	>=dev-python/websockets-16.0
"
