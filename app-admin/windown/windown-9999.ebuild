# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit git-r3

DESCRIPTION="Download Microsoft Windows install files, and other Microsoft products."
HOMEPAGE="http://gitee.com/your-own-os/windown"
EGIT_REPO_URI="https://gitee.com/your-own-os/windown.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="dev-python/selenium
         net-misc/wget"
DEPEND="${RDEPEND}"

