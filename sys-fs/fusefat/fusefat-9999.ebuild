# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="FUSE for FAT12 / FAT16 / FAT32 file systems"
HOMEPAGE="https://gitee.com/your-own-os/fusefat"
EGIT_REPO_URI="https://gitee.com/your-own-os/fusefat"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND="dev-libs/glib:2
	sys-fs/fuse:0"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S=${WORKDIR}/fuse-umfuse-fat-0.1
