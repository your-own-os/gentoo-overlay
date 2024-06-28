# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="DOS game SPACEWAR"
HOMEPAGE=""
SRC_URI="mirror://myabandonware-game/spaceware-6o/Spacewar_DOS_EN.zip"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip"
RDEPEND=""

S=${WORKDIR}

src_install() {
	insinto /opt/spacewar
	doins -r Spacewar/*
}

pkg_postinst() {
	elog "A client is needed to run the game, e.g. games-emulation/dosbox."
	echo
}
