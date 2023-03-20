# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="Gentoo bashrc script"
HOMEPAGE="https://fa.krinkels.org"
SRC_URI="https://fa.krinkels.org/downloads/0.666/FreeArc-${PV}-linux-i386.tar.bz2"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND=""

S=${WORKDIR}/FreeArc-${PV}-linux-i386

src_compile() {
	mv bin/unarc bin/freearc-unarc
}

src_install() {
	dobin bin/freearc-unarc
}
