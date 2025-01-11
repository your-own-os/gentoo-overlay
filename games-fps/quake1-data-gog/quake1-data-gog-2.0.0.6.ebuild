# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Data files for iD Software's Quake1 from gog.com"
HOMEPAGE="https://www.gog.com/en/game/quake_the_offering"
SRC_URI="mirror://gog/setup_quake_the_offering_${PV}.exe"
LICENSE="GOG-EULA"
SLOT="0"
KEYWORDS="~amd64 ~arm ~m68k ~x86"
RESTRICT="bindist "

BDEPEND="app-arch/innoextract"

S="${WORKDIR}"

pkg_nofetch() {
	einfo "Please buy and download ${SRC_URI} from:"
	einfo "  ${HOMEPAGE}"
	einfo "and move it to your distfiles directory."
}

src_install() {
	innoextract --extract \
		--include=/app \
		"${DISTDIR}/${A}" || die

	insinto /usr/share/quake1/id1
	newins app/id1/PAK0.PAK pak0.pak
	newins app/id1/PAK1.PAK pak1.pak
	doins app/id1/autoexec.cfg
	doins app/id1/config.cfg

	dodoc app/Docs/*
}
