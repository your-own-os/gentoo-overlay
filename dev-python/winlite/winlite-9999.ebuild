# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{6..12} )

inherit distutils-r1 git-r3

DESCRIPTION="Modify Microsoft Windows installation ISO file."
HOMEPAGE="https://github.com/your-own-os/winlite"
EGIT_REPO_URI="https://gitee.com/your-own-os/winlite.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/pyparted
        sys-boot/grub"
RDEPEND=""
