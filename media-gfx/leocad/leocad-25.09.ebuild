EAPI=8

inherit qmake-utils xdg

DESCRIPTION="CAD application for creating virtual LEGO models"
HOMEPAGE="https://www.leocad.org/ https://github.com/leozide/leocad"
SRC_URI="mirror://github/leozide/leocad/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-qt/qtbase:6[concurrent,gui,network,opengl,widgets,xml]
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-qt/qttools:6[linguist]
"

src_prepare() {
	default
	sed -i -e 's:#include <QOpenGLFunctions_3_2_Core>:#include <QtOpenGL/qopenglversionfunctions.h>:' common/lc_context.cpp common/lc_glextensions.cpp || die
}

src_configure() {
	eqmake6 \
		DISABLE_UPDATE_CHECK=1 \
		INSTALL_PREFIX="${EPREFIX}/usr"
}

src_install() {
	emake install INSTALL_ROOT="${ED}"
}

pkg_postinst() {
	xdg_pkg_postinst
	elog "LeoCAD does not ship the LDraw parts library in its source tarball."
	elog "Download the matching upstream Library archive if you want the built-in parts database."
}

pkg_postrm() {
	xdg_pkg_postrm
}
