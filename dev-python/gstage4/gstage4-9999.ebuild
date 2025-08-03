# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{6..13} )

inherit distutils-r1 git-r3

DESCRIPTION="A python module for building stage4 of Gentoo Linux."
HOMEPAGE=""
EGIT_REPO_URI="https://gitee.com/your-own-os/gstage4.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/PySquashfsImage[${PYTHON_USEDEP}]
        dev-python/aiofiles[${PYTHON_USEDEP}]
        dev-python/aioshutil[${PYTHON_USEDEP}]
        dev-python/asyncio-pool[${PYTHON_USEDEP}]
        dev-python/mrget[${PYTHON_USEDEP}]
        dev-python/passlib[${PYTHON_USEDEP}]
        dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/tenacity[${PYTHON_USEDEP}]
        net-misc/wget"
RDEPEND=""

src_install() {
        distutils-r1_src_install

        emake DESTDIR="${D}" install
}
