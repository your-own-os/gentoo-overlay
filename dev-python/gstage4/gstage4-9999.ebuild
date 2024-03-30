# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{6..12} )

inherit distutils-r1 git-r3

DESCRIPTION="A python module for building stage4 of Gentoo Linux."
HOMEPAGE=""
EGIT_REPO_URI="https://gitee.com/your-own-os/gstage4.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/mrget[${PYTHON_USEDEP}]
        dev-python/PySquashfsImage[${PYTHON_USEDEP}]"
RDEPEND=""

src_install() {
        distutils-r1_src_install

        emake DESTDIR="${D}" install
}
