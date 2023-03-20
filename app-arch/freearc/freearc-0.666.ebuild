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

S=${WORKDIR}

src_install() {
	aaa
	# dodir "/etc/portage"
	# mkdir "${D}/etc/portage/bashrc.d"
	# touch "${D}/etc/portage/bashrc.d/.keep"
	# cp "${FILESDIR}/bashrc" "${D}/etc/portage"
}
