# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit check-reqs

MY_PN=${PN/-prog/}

DESCRIPTION="Program files for Need For Speed 8"
HOMEPAGE=""
SRC_URI="mirror://librungame-repacks/${MY_PN}/${MY_PN}.7z"
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
	7z x ${DISTDIR}/${A}
}

src_install() {
	dodir "opt/${MY_PN}"
	cp -r * "${D}/opt/${MY_PN}"
}
