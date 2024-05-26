# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit desktop

DESCRIPTION="Legend of Kyrandia 2 - Hand"
HOMEPAGE=""
SRC_URI=""
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND=""
RDEPEND="games-puzzle/legend-of-kyrandia2-data
         games-engines/scummvm"

S=${WORKDIR}

src_install() {
	dobin "${FILESDIR}/${PN}"
}
