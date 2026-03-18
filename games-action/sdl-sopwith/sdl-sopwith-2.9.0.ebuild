# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Classic bi-plane shoot-'em up game"
HOMEPAGE="https://github.com/fragglet/sdl-sopwith"
SRC_URI="mirror://github/fragglet/sdl-sopwith/archive/refs/tags/sdl-sopwith-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="media-libs/libsdl2"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf --with-hiscores-path=/var/games/sopwith
}

src_install() {
	emake DESTDIR="${D}" install
}
