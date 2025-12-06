# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{9..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 git-r3

EGIT_REPO_URI="https://gitee.com/your-own-os/bnetd"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="--fixme"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="dev-python/pygobject
         dev-python/netifaces
         dev-python/pyroute2
         dev-python/toposort
         dev-python/jsoncomment
         net-dns/dnsmasq
         net-fs/samba
         net-misc/wakeonlan
         >=sys-apps/iproute2-2.6.34"
DEPEND=""

# install program by make
# install python module by distutils

src_compile() {
	emake || die "emake failed"
	distutils-r1_src_compile
}

src_install() {
	emake DESTDIR="${D}" install
	distutils-r1_src_install
}
