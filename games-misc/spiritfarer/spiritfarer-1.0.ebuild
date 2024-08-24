# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Spiritfarer is a cozy management game about dying."
HOMEPAGE=""
SRC_URI="mirror://gog/spiritfarer_35325c_linux_54594.sh"
LICENSE="unknown"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="bindist"

RDEPEND=""
DEPEND="app-arch/p7zip"

S="${WORKDIR}"

src_unpack() {
	7z x "${DISTDIR}/${A}" || die

	rm usr/bin/game/goggame*

	find . -type f | xargs chmod 644
	find . -type d | xargs chmod 755
	chmod 755 usr/bin/game/Spiritfarer.exe
}

src_install() {
	# usr/bin/game/Spiritfarer.exe has mode 755 so that we can't use doins
	dodir opt
	cp -r usr/bin/game "${D}/opt/${PN}"

	dosym ../../../opt/${PN}/SpiritFarer.exe /usr/bin/${PN}
	dosym ../../../opt/${PN}/SpiritFarer_Data/Resources/UnityPlayer.png /usr/share/pixmaps/${PN}.png
	domenu "${FILESDIR}/${PN}.desktop"
}
