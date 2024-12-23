# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="Data files for Limbo from gog.com"
HOMEPAGE="https://www.gog.com/en/game/limbo"
SRC_URI="mirror://gog/setup_limbo_3.0.0.1a_(12082).exe"
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
		--include=/limbo.exe \
		--include=/limbo_boot.pkg \
		--include=/limbo_runtime.pkg \
		--include=/data \
		--include=/titledata \
                --include=/lang \
		"${DISTDIR}/${A}" || die

	insinto /opt/limbo
	doins doom.wad
}
