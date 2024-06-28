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
	# DOS only not accept filename in 8.3 format
	mv space-war/Spacewar.1985.exe space-war/SPACEWAR.EXE

	insinto /opt/spacewar
	doins -r space-war/*
}

pkg_postinst() {
	elog "A client is needed to run the game, e.g. games-emulation/dosbox."
	echo
}
