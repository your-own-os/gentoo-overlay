# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="CISCO HEAT"
HOMEPAGE=""
SRC_URI="mirror://archive-org-download/msdos_Cisco_Heat_-_All_American_Police_Car_Race_1991/Cisco_Heat_-_All_American_Police_Car_Race_1991.zip"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip"
RDEPEND=""

S=${WORKDIR}

src_install() {
	insinto /opt/ciscoheat
	doins -r CiscoHea/{cisco.*,music.dat}
}

pkg_postinst() {
	elog "A client is needed to run the game, e.g. games-emulation/dosbox."
	echo
}
