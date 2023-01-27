# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit systemd

DESCRIPTION="Load kernel modules that has static device node"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND="sys-apps/kmod"

S=${WORKDIR}

src_install() {
	exeinto /usr/libexec
	doexe "${FILESDIR}/load-modules-with-static-node.sh"

	systemd_dounit "${FILESDIR}/load-modules-with-static-node.service"
	systemd_enable_service sysinit load-modules-with-static-node
}
