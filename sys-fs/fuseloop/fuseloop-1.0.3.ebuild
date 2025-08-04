# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="Loopback mount utility using FUSE"
HOMEPAGE="https://github.com/jmattsson/fuseloop"
SRC_URI="mirror://github/jmattsson/fuseloop/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="-* amd64 x86"
LICENSE="unknown"
SLOT="0"
IUSE=""

RDEPEND="sys-fs/fuse"
DEPEND="${RDEPEND}"

src_install() {
	insinto /usr/bin
	dobin fuseloop
}
