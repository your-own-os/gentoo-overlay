# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Gitee CLI is a tool which interact with gitee server seamlessly via terminal"
HOMEPAGE="https://github.com/JJ-H/gitee_cli"
SRC_URI="https://github.com/JJ-H/gitee_cli/releases/download/v${PV}/gitee-v${PV}-linux-amd64.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror network-sandbox"

RDEPEND=""
DEPEND=""
BDEPEND=""

S="${WORKDIR}"

src_install() {
	newbin gitee gitee-cli
}
