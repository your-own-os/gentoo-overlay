# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A Sci-Fi-Mystery Adventure Game with handmade scenery."
HOMEPAGE=""
SRC_URI="mirror://linuxgame/Truberbrook/Truberbrook_amd64.appimage"
LICENSE="unknown"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="bindist"

RDEPEND=""
DEPEND="app-arch/p7zip"

S="${WORKDIR}"

src_unpack() {
	7z x ${A} || die
}

src_install() {
	insinto /opt/truberbrook
	doins -r usr/bin/*
}
