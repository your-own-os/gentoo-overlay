# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit estack

# For GOG install
MY_EXE="setup_legend_of_kyrandia2_2.1.0.7.exe"

DESCRIPTION="Data files for Legend of Kyrandia 2 - The Hand of Fate"
HOMEPAGE=""
SRC_URI="mirror://gog/${MY_EXE}"
LICENSE="unknown"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"
IUSE="doc"
RESTRICT="bindist"

RDEPEND=""
DEPEND="app-arch/innoextract"

S="${WORKDIR}"

src_unpack() {
	innoextract -e -s -p0 -I app "${DISTDIR}/${MY_EXE}" || die
	rm -rf app/{kyra2-cd.ini,ScummVM,__support,webcache.zip,goggame-*,*.dll}
}

src_install() {
	[[ -d doc ]] && dodoc app/*.pdf
	rm app/*.pdf

	insinto /opt/legend-of-kyrandia2
	doins -r app/*
}

pkg_postinst() {
	elog "A client is needed to run the game, e.g. games-engines/scummvm."
	echo
}
