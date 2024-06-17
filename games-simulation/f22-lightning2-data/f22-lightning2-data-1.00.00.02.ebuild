# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit estack

# For GOG install
MY_EXE="setup_legend_of_kyrandia_2.1.0.14.exe"

DESCRIPTION="Data files for Legend of Kyrandia"
HOMEPAGE=""
SRC_URI="mirror://myabandonware-game/f22-lightning-ii-a50/F-22-Lightning-II_DOS_EN_RIP-Version.zip
         mirror://myabandonware-game/f22-lightning-ii-a50/F-22-Lightning-II_RefCard_DOS_EN.pdf"
LICENSE="unknown"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"
IUSE="doc"
RESTRICT="bindist"

RDEPEND=""
DEPEND=""

S="${WORKDIR}"

src_install() {
	[[ -d doc ]] && dodoc *.pdf

	insinto /opt/f22-lightning2
	doins -r f22/*
}

pkg_postinst() {
	elog "A client is needed to run the game, e.g. app-emulation/dosbox."
	echo
}
