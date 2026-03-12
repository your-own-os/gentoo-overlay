# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Paperclip CLI for orchestrating AI agent teams"
HOMEPAGE="https://github.com/paperclipai/paperclip"
SRC_URI="https://registry.npmjs.org/${PN}/-/${P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror network-sandbox"

RDEPEND=">=net-libs/nodejs-20[npm]"
DEPEND=""
BDEPEND=""

S="${WORKDIR}/package"

src_compile() {
	npm_config_cache="${WORKDIR}/.npm-cache" \
		npm_config_update_notifier=false \
		npm_config_fund=false \
		npm install --omit=dev --no-audit || die "npm install failed"
}

src_install() {
	insinto "/usr/lib64/node_modules/${PN}"
	doins -r LICENSE README.md dist package.json package-lock.json node_modules
	fperms +x "/usr/lib64/node_modules/${PN}/dist/index.js"
	dosym "../lib64/node_modules/${PN}/dist/index.js" "/usr/bin/${PN}"
}
