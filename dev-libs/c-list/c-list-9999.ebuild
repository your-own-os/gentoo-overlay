# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit multilib-minimal meson git-r3

DESCRIPTION="Circular Intrusive Double Linked List Collection"
HOMEPAGE="https://c-util.github.io/c-list"
EGIT_REPO_URI="mirror://github/c-util/c-list"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

RDEPEND=""
DEPEND="virtual/pkgconfig[${MULTILIB_USEDEP}]"

