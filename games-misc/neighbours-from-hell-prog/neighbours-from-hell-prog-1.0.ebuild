# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

MY_PN=${PN/-prog/}

DESCRIPTION="Program files for Neighbours from Hell"
HOMEPAGE="http://www.neighbours-from-hell.com"
SRC_URI="mirror://librungame-repacks/${MY_PN}/${MY_PN}.7z"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/p7zip"
RDEPEND=""

S="${WORKDIR}"

src_unpack() {
	7z x ${DISTDIR}/${A}
}

src_install() {
	dodir "opt/${MY_PN}"
	cp -r * "${D}/opt/${MY_PN}"
}
