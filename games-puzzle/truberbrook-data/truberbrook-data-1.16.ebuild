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
	7z x "${DISTDIR}/${A}" || die

	rm usr/bin/run.sh

	find . -type f | xargs chmod 644
	find . -type d | xargs chmod 755
	chmod 755 usr/bin/Truberbrook
}

src_install() {
	# usr/bin/Truberbrook has mode 755 so that we can't use doins
	dodir opt
	cp -r usr/bin "${D}/opt/truberbrook"
	cp -r Truberbrook.png "${D}/opt/truberbrook"
}
