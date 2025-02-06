# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit flag-o-matic

DESCRIPTION="Glide/DirectX implementation on D3D11/12 "
HOMEPAGE="https://github.com/dege-diosg/dgVoodoo2"
SRC_URI="https://github.com/dege-diosg/dgVoodoo2/releases/download/v${PV}/dgVoodoo2_84_1.zip -> ${P}.zip"

KEYWORDS="-* amd64 x86"
LICENSE="Unknown"
SLOT="0"
IUSE=""

S=${WORKDIR}

src_install() {
	rm -rf 3Dfx/arm64
	rm -rf MS/arm64x

	dodir usr/lib/dgVoodoo2
	cp -r 3Dfx ${D}/usr/lib/dgVoodoo2
	cp -r MS ${D}/usr/lib/dgVoodoo2
	dodoc dgVoodoo.conf
}

pkg_postinst() {
	elog "To enable ${PN} on a wine prefix, you can run the following command:"
	elog
	elog "	WINEPREFIX=/path/to/prefix setup_dxvk.sh install --symlink"
	elog
	elog "See ${EROOT}/usr/share/doc/${PF}/README.md* for details."
	elog "Note: setup_dxvk.sh is unofficially temporarily provided as it was"
	elog "removed upstream, handling may change in the future."
}
