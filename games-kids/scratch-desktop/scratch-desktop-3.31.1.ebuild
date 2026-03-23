# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg-utils

DESCRIPTION="Scratch 3.0 as a self-contained desktop application"
HOMEPAGE="https://scratch.mit.edu/ https://github.com/scratchfoundation/scratch-desktop"
SRC_URI="https://2github.com/scratchfoundation/scratch-desktop/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="network-sandbox mirror strip"

RDEPEND="
	dev-libs/nss
	x11-libs/libXtst
	x11-libs/libnotify
	x11-libs/libXScrnSaver
	media-libs/alsa-lib
	net-print/cups
	app-accessibility/at-spi2-core
"
BDEPEND="
	net-libs/nodejs[npm]
	dev-nodejs/webpack
"

S="${WORKDIR}/${P}"

src_prepare() {
	default
}

src_compile() {
	export npm_config_cache="${WORKDIR}/npm_cache"

	npm install --no-audit --no-fund --electron_mirror="https://npmmirror.com/mirrors/electron/" || die "npm install failed"

	NODE_ENV=production webpack --config webpack.renderer.js || die "webpack renderer build failed"
	NODE_ENV=production webpack --config webpack.main.js || die "webpack main build failed"
}

src_install() {
	local ELECTRON_DIR="node_modules/electron/dist"

	insinto /opt/${PN}
	doins -r dist/
	doins package.json

	cp -r "${ELECTRON_DIR}"/* "${D}/opt/${PN}/dist/" || die "Failed to copy electron"

	find "${D}/opt/${PN}/dist/" -name "electron" -exec chmod 0755 {} \;
	find "${D}/opt/${PN}/dist/" -name "scratch-desktop" -exec chmod 0755 {} \;
	find "${D}/opt/${PN}/dist/" -name "chrome-sandbox" -exec chmod 4755 {} \;
	find "${D}/opt/${PN}/dist/" -name "chrome_crashpad_handler" -exec chmod 0755 {} \;

	dosym /opt/${PN}/dist/electron /usr/bin/scratch-desktop

	doicon -s 256 "${FILESDIR}/scratch-desktop.png"
	domenu "${FILESDIR}/scratch-desktop.desktop"
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
