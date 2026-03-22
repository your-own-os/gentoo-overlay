# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 desktop xdg-utils

DESCRIPTION="Lightweight virtual machine manager with MCP server support"
HOMEPAGE="https://gitee.com/your-own-os/lightbox"
EGIT_REPO_URI="https://gitee.com/your-own-os/lightbox.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	app-emulation/qemu[spice,virtfs]
	net-misc/spice-gtk[gtk3]
	dev-python/python-qemu-qmp
	dev-python/elemlib
	app-emulation/virt-service
	dev-python/mrget
	net-misc/socat
"
DEPEND="${RDEPEND}"
BDEPEND=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_compile() {
	:
}

src_install() {
	dodir /usr/{bin,lib/lightbox,share/lightbox/icons,share/lightbox/ui}

	insinto /usr/lib/lightbox
	doins -r lib/core
	doins -r lib/plugins

	exeinto /usr/bin
	doexe lightbox

	newexe scripts/lbctl lbctl
	fperms 755 /usr/bin/lbctl

	insinto /usr/share/lightbox
	doins -r icons
	doins -r data
	doins -r doc

	newinitd "${FILESDIR}/lightbox.initd" lightbox
	newconfd "${FILESDIR}/lightbox.confd" lightbox
}

pkg_postinst() {
	xdg_icon_cache_update

	elog "Lightbox VM Manager has been installed."
	elog ""
	elog "To start the GUI:"
	elog "  lightbox"
	elog ""
	elog "To use the CLI:"
	elog "  lbctl list"
	elog "  lbctl list-os"
	elog "  lbctl create gentoo \"My VM\""
	elog ""
	elog "MCP server socket: ~/.local/share/lightbox/lightbox.sock"
}

pkg_postrm() {
	xdg_icon_cache_update
}
