# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-info udev

DESCRIPTION="udev rules for block device uaccess tag modification"
HOMEPAGE=""
LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="virtual/udev"

S="${WORKDIR}"

src_install() {
	udev_dorules ${FILESDIR}/69-block-device-uaccess.rules
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
