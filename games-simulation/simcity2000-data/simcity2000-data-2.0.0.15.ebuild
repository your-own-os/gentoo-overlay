# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit estack

# For GOG install
MY_EXE="setup_sc2000_se_2.0.0.15.exe"

DESCRIPTION="Data files for SimCity2000 Special Edition"
HOMEPAGE=""
SRC_URI="mirror://gog/${MY_EXE}"
LICENSE="unknown"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"
IUSE="doc"
RESTRICT="bindist"

RDEPEND=""
DEPEND="app-arch/innoextract"

S="${WORKDIR}"

src_unpack() {
	innoextract -e -s -p0 -I app "${DISTDIR}/${MY_EXE}" || die

	# remove dosbox stuff
	rm -rf app/DOSBOX app/dosbox*.conf

	# remove gog stuff
	rm app/*.ico app/*.dll app/loader.*
}

src_install() {
	if use doc ; then
		insinto /usr/share/doc/simcity2000
		doins app/*.pdf
	fi
	rm app/*.pdf

	insinto /opt/simcity2000
	doins -r app/*
}

pkg_postinst() {
	elog "A client is needed to run the game, e.g. app-emulation/dosbox."
	echo
}
