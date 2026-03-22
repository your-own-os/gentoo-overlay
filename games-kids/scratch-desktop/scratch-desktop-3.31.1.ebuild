# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg-utils

DESCRIPTION="Scratch 3.0 as a standalone desktop application"
HOMEPAGE="https://scratch.mit.edu/ https://github.com/scratchfoundation/scratch-desktop"
SRC_URI="mirror://github/scratchfoundation/scratch-desktop/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="network-sandbox mirror strip"

RDEPEND="
	dev-libs/nss
	gnome-base/gconf
	x11-libs/libXtst
	x11-libs/libnotify
	x11-libs/libXScrnSaver
	media-libs/alsa-lib
	net-print/cups
	app-accessibility/at-spi2-core
"
BDEPEND="
	net-libs/nodejs[npm]
"

S="${WORKDIR}/${P}"

src_prepare() {
	default
}

src_compile() {
	export npm_config_cache="${WORKDIR}/npm_cache"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1

	npm install --no-audit --no-fund || die "npm install failed"

	NODE_ENV=production npx webpack --config webpack.renderer.js || die "webpack renderer build failed"
	NODE_ENV=production npx webpack --config webpack.main.js || die "webpack main build failed"

	mkdir -p static/fetched || die
	node ./scripts/fetchMediaLibraryAssets.js || die "fetch media assets failed"

	npx electron-builder --linux AppImage --x64 || die "electron-builder failed"
}

src_install() {
	local appimage
	appimage=$(find dist -name "*.AppImage" -print -quit)
	if [[ -z "${appimage}" ]]; then
		die "AppImage not found in dist/"
	fi

	chmod +x "${appimage}" || die
	cd "${WORKDIR}" || die
	"${S}/${appimage}" --appimage-extract || die "Failed to extract AppImage"

	insinto /opt/${PN}
	doins -r squashfs-root/*

	fperms 0755 /opt/${PN}/scratch-desktop
	fperms 0755 /opt/${PN}/chrome-sandbox
	fperms 0755 /opt/${PN}/chrome_crashpad_handler

	dosym /opt/${PN}/scratch-desktop /usr/bin/scratch-desktop

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
