# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="su -c wrapper to behave like sudo"
HOMEPAGE="https://gitee.com/your-own-os"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="sys-apps/util-linux[su]"
BDEPEND=""

src_install() {
    insinto /usr/bin
    doins "${FILESDIR}/sudo"
    fperms 0755 /usr/bin/sudo
}
