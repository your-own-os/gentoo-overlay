# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{6..13} )
ISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 git-r3

DESCRIPTION="A python module for building customized disk image of Microsoft Windows."
HOMEPAGE=""
EGIT_REPO_URI="https://gitee.com/your-own-os/wstage4.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="app-emulation/qemu[python]
         app-misc/hivex[python]
         dev-python/chardet[${PYTHON_USEDEP}]
         dev-python/pycdlib[${PYTHON_USEDEP}]
         dev-python/pyparted[${PYTHON_USEDEP}]
         dev-python/pytesseract[${PYTHON_USEDEP}]
         dev-python/pillow[${PYTHON_USEDEP}]
         sys-fs/fuseloop
         sys-fs/fusefat
         sys-fs/fatresize
         sys-fs/ntfs3g[suid]"
