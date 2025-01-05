# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="Program files for Total Annihilation: Commander Pack"
HOMEPAGE="https://www.gog.com/zh/game/total_anihilation_commander_pack"
SRC_URI="mirror://gog/setup_total_annihilation_commander_pack_${PV}.exe"
LICENSE="GOG-EULA"
SLOT="0"
KEYWORDS="~amd64 ~arm ~m68k ~x86"

BDEPEND="app-arch/innoextract"

S="${WORKDIR}"

pkg_nofetch() {
	einfo "Please buy and download ${SRC_URI} from:"
	einfo "  ${HOMEPAGE}"
	einfo "and move it to your distfiles directory."
}

src_install() {
	innoextract --extract --lowercase \
		--include=/app \
		"${DISTDIR}/${A}" || die

	insinto /opt/total-annihilation
	doins -r app/*
}
