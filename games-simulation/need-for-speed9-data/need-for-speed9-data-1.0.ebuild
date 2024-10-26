# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit check-reqs desktop

MY_PN=${PN/-data/}

DESCRIPTION="Need For Speed 9 - Most Wanted Black Edition"
HOMEPAGE="http://www.ea.com/need-for-speed-most-wanted"
SRC_URI="mirror://librungame-repacks/need-for-speed9/need-for-speed9.7z"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/p7zip"
RDEPEND=""

CHECKREQS_DISK_BUILD=5G

S="${WORKDIR}"

src_unpack() {
	7z x ${A}
}

src_install() {
	dodir "opt/${MY_PN}"
	cp -r * "${D}/opt/${MY_PN}"
}
