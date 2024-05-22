# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit desktop

DESCRIPTION="Factorio"
HOMEPAGE=""
SRC_URI="mirror://bittorent/Factorio_Linux/factorio_alpha_x64_${PV}.tar.xz"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND=""
RDEPEND="virtual/wine[abi_x86_32]"

S=${WORKDIR}

#src_prepare() {
#	return
#}

src_unpack() {
	return
}

src_install() {
	mkdir "${D}/opt"
	tar -xJf "${DISTDIR}/factorio_alpha_x64_${PV}.tar.xz" -C "${D}/opt"

	dosym ../../opt/factorio/bin/x64/factorio "/usr/bin/${PN}"
	doicon "${D}/opt/factorio/data/core/graphics/factorio.png"

	domenu "${FILESDIR}/${PN}.desktop"
	# make_desktop_entry "${PN}" "${PN}" "${PN}" "Games;"	# complains Games is not a standard category?
}
