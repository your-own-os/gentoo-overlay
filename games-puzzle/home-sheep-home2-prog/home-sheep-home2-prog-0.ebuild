# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit desktop

MY_PN=${PN/-prog/}

DESCRIPTION="Program files for Home Sheep Home 2 - A Little Epic"
HOMEPAGE="http://homesheephome2.com"
SRC_URI="mirror://bittorrent/f8d851d8833de8e8e6f51654d0e176d261356c31.Home_Sheep_Home_2_no_install/Home%20Sheep%20Home%202%20%28no%20install%29.rar -> ${PN}.rar"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unrar"
RDEPEND=""

S="${WORKDIR}"

src_unpack() {
	unrar x "${DISTDIR}/${A}"
}

src_install() {
	dodir "opt/${MY_PN}"
	cp -r * "${D}/opt/${MY_PN}"
}
