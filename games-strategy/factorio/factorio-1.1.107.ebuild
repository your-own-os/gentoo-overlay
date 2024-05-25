# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit desktop

DESCRIPTION="Factorio"
HOMEPAGE="https://www.factorio.com"
SRC_URI="mirror://bittorent/Factorio_Linux/factorio_alpha_x64_${PV}.tar.xz"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND=""
RDEPEND="games-strategy/factorio-data
         dev-python/librungame"

S=${WORKDIR}

src_unpack() {
	tar -xJf "${DISTDIR}/${A}" --strip-components=4 factorio/data/core/graphics/factorio.png
}

src_install() {
	dobin "${FILESDIR}/${PN}"
	doicon ${PN}.png
	domenu "${FILESDIR}/${PN}.desktop"
	# make_desktop_entry "${PN}" "${PN}" "${PN}" "Games;"	# complains Games is not a standard category?
}
