# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=( python3_{6..12} )

inherit distutils-r1 git-r3

DESCRIPTION="Pure python implementation of grub2 installing process."
HOMEPAGE="https://github.com/fpemud-os/grub_install"
EGIT_REPO_URI="https://gitee.com/your-own-os/grub_install.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/pyparted[${PYTHON_USEDEP}]
         dev-python/reedsolo[${PYTHON_USEDEP}]
         sys-boot/grub"
