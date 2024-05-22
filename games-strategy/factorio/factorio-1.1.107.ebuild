# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="Factorio"
HOMEPAGE=""
SRC_URI="mirror://bittorent/Factorio_Linux/factorio_alpha_x64_1.1.107.tar.xz"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND=""
RDEPEND="virtual/wine[abi_x86_32]"

src_prepare() {
	return
}

src_unpack() {
	return
}

src_install() {
	mkdir "${D}/opt"
	tar xJf "${DISTDIR}/${P}.zip" -d "${D}/opt"

	dosym /opt/factorio/bin/x64/factorio "${D}/usr/bin/factorio"
	doicon "${D}/opt/factorio/core/graphics/factorio.png"
	domenu "${FILESDIR}/${P}.desktop"
}
