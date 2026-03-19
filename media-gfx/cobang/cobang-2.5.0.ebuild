EAPI=8

PYTHON_COMPAT=( python3_{12..13} )

inherit gnome2-utils meson python-single-r1 xdg

DESCRIPTION="GTK QR code and barcode scanner for Linux desktops"
HOMEPAGE="https://github.com/hongquan/CoBang"
SRC_URI="mirror://github/hongquan/CoBang/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RESTRICT="test"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-libs/glib-2.80:2
	>=dev-libs/gobject-introspection-1.82.0-r2:=
	dev-libs/libportal[gtk,introspection]
	>=gui-libs/gtk-4.12:4
	>=gui-libs/libadwaita-1.5:1
	media-gfx/zbar[gtk,python,${PYTHON_SINGLE_USEDEP}]
	>=media-libs/gstreamer-1.24:1.0[introspection]
	>=media-libs/gst-plugins-base-1.24:1.0[introspection,opengl]
	media-plugins/gst-plugin-gtk4
	media-video/pipewire[gstreamer]
	net-misc/networkmanager[introspection,wifi]
	$(python_gen_cond_dep '
		dev-python/logbook[${PYTHON_USEDEP}]
		>=dev-python/pillow-10[${PYTHON_USEDEP}]
		dev-python/pygobject:3[${PYTHON_USEDEP}]
		dev-python/qrcode[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-util/blueprint-compiler
	dev-util/glib-utils
	sys-devel/gettext
"

S="${WORKDIR}/CoBang-${PV}"

src_install() {
	meson_src_install
	python_fix_shebang "${ED}"
	python_optimize
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
