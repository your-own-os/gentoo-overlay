# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Light dock for Linux - Core library and daemon"
HOMEPAGE="https://www.glx-dock.org/"
SRC_URI="https://github.com/Cairo-Dock/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="
	X wayland egl gtk-layer-shell glu curl systemd desktop-manager
"

REQUIRED_USE="
	|| ( X wayland )
	gtk-layer-shell? ( wayland )
	egl? ( X )
"

RDEPEND="
	dev-libs/glib:2
	dev-libs/libxml2
	x11-libs/cairo
	gnome-base/librsvg:2
	sys-apps/dbus
	dev-libs/dbus-glib
	net-misc/curl
	media-libs/libglvnd
	X? (
		x11-libs/libX11
		x11-libs/libXcomposite
		x11-libs/libXext
		x11-libs/libXrandr
		x11-libs/libXrender
		glu? ( virtual/glu )
	)
	wayland? (
		dev-libs/wayland
		gtk-layer-shell? ( gui-libs/gtk-layer-shell )
	)
	egl? ( media-libs/mesa[egl(+)] )
	gtk-layer-shell? ( gui-libs/gtk-layer-shell )
	systemd? ( sys-apps/systemd )
	desktop-manager? (
		gnome-base/gnome-session
		gnome-base/gnome-settings-daemon
	)
"
DEPEND="
	${RDEPEND}
	wayland? (
		kde-frameworks/extra-cmake-modules
	)
"
BDEPEND="
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}/0001-compiz-guard-X11.patch"
)

DOCS=( README.md INSTALL LICENSE ChangeLog )

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX=/usr
		-Denable-x11-support=$(usex X)
		-Denable-glx-support=$(usex X)
		-Denable-egl-support=$(usex egl)
		-Denable-wayland-support=$(usex wayland)
		-Denable-wayland-protocols=$(usex wayland)
		-Denable-gtk-layer-shell=$(usex gtk-layer-shell)
		-Denable-systemd-service=$(usex systemd)
		-Denable-desktop-manager=$(usex desktop-manager)
	)

	cmake_src_configure
}
