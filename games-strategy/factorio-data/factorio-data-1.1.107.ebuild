# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="Factorio"
HOMEPAGE=""
SRC_URI="mirror://bittorent/Factorio_Linux/factorio_alpha_x64_${PV}.tar.xz"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND=""
RDEPEND=""

S=${WORKDIR}

src_unpack() {
	return
}

src_install() {
	dodir opt
	tar -xJf "${DISTDIR}/factorio_alpha_x64_${PV}.tar.xz" -C "${D}/opt"
}
