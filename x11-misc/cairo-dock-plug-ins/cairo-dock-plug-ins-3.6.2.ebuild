# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Light dock for Linux - Plugins and applets"
HOMEPAGE="https://www.glx-dock.org/"
SRC_URI="https://github.com/Cairo-Dock/cairo-dock-plug-ins/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	~x11-misc/cairo-dock-core-${PV}
	dev-libs/glib:2
	alsa? ( media-libs/alsa-lib )
	dbusmenu? (
		dev-libs/libdbusmenu
		dev-libs/libdbusmenu-glib
	)
	indicator? (
		dev-libs/ayatana-ido
		dev-libs/libayatana-indicator
	)
	gmenu? ( gnome-base/gnome-menus )
	gnome-integration? ( gnome-base/gnome-menus )
	kde-integration? ( kde-frameworks/kio )
	mail? ( net-libs/libetpan )
	sound-effects? ( media-libs/alsa-lib )
	terminal? ( x11-libs/vte )
	upower? ( sys-power/upower )
	weather? ( dev-libs/json-c )
"
DEPEND="
	${RDEPEND}
"
BDEPEND="
	virtual/pkgconfig
"

IUSE="
	alsa dbusmenu gmenu gnome-integration kde-integration mail sound-effects terminal upower weather
	indicator sensors ical xrandr exif
	enable-disks enable-network-monitor enable-scooby-do enable-weblets
"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX=/usr
		-Denable-alsa-mixer=$(usex alsa)
		-Denable-dbusmenu-support=$(usex dbusmenu)
		-Denable-indicator-support=$(usex indicator)
		-Denable-libido-support=$(usex indicator)
		-Denable-gmenu=$(usex gmenu)
		-Denable-gnome-integration=$(usex gnome-integration)
		-Denable-kde-integration=$(usex kde-integration)
		-Denable-mail=$(usex mail)
		-Denable-sound-effects=$(usex sound-effects)
		-Denable-terminal=$(usex terminal)
		-Denable-upower-support=$(usex upower)
		-Denable-ical-support=$(usex ical)
		-Denable-xrandr-support=$(usex xrandr)
		-Denable-exif-support=$(usex exif)
		-Denable-sensors-support=$(usex sensors)
		-Denable-disks=$(usex enable-disks)
		-Denable-network-monitor=$(usex enable-network-monitor)
		-Denable-scooby-do=$(usex enable-scooby-do)
		-Denable-weblets=$(usex enable-weblets)
	)

	cmake_src_configure
}
