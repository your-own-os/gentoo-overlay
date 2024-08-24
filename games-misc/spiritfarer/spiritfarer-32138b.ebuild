# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg-utils

DESCRIPTION="Spiritfarer is a cozy management game about dying."
HOMEPAGE=""
SRC_URI="mirror://gog/spiritfarer_32138b_linux_40595.sh"
LICENSE="unknown"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="bindist"

RDEPEND=""
DEPEND="app-arch/p7zip"

S="${WORKDIR}"

src_unpack() {
	unpack_zip ${A}

	rm data/noarch/game/goggame*

	find . -type f | xargs chmod 644
	find . -type d | xargs chmod 755
	chmod 755 data/noarch/game/spiritfarer.x86_64
}

src_install() {
	# data/noarch/game/spiritfarer.x86_64 has mode 755 so that we can't use doins
	dodir opt
	cp -r data/noarch/game "${D}/opt/${PN}"

	dosym ../../opt/${PN}/spiritfarer.x86_64 /usr/bin/${PN}
	dosym ../../../opt/${PN}/spiritfarer_Data/Resources/UnityPlayer.png /usr/share/pixmaps/${PN}.png
	domenu "${FILESDIR}/${PN}.desktop"
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
