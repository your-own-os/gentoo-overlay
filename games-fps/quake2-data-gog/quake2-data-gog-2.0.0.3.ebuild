# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Data files for iD Software's Quake 2 from gog.com"
HOMEPAGE="https://www.gog.com/en/game/quake_ii_quad_damage"
SRC_URI="mirror://gog/setup_quake2_quad_damage_${PV}.exe"
LICENSE="GOG-EULA"
SLOT="0"
KEYWORDS="~amd64 ~arm ~m68k ~x86"
IUSE="videos"
RESTRICT="bindist "

BDEPEND="app-arch/innoextract"

S="${WORKDIR}"

pkg_nofetch() {
	einfo "Please buy and download ${SRC_URI} from:"
	einfo "  ${HOMEPAGE}"
	einfo "and move it to your distfiles directory."
}

src_install() {
	innoextract --extract \
		--include=/app \
		"${DISTDIR}/${A}" || die

	dodir /usr/share/quake2/baseq2

	if use videos ; then
		insinto /usr/share/quake2/baseq2/video
		doins app/baseq2/video/*
	fi

	insinto /usr/share/quake2/baseq2
	doins app/baseq2/*.pak
	doins app/baseq2/maps.lst
	doins -r app/baseq2/players

	for mod in ctf rogue xatrix ; do
		if [[ -d app/${mod} ]] ; then
			if use videos && [[ -d app/baseq2/../${mod}/video ]] ; then
				insinto /usr/share/quake2/${mod}/video
				doins app/${mod}/video/* 2>/dev/null
			fi
			if [[ -n $(ls app/${mod}/*.pak 2>/dev/null) ]] ; then
				insinto /usr/share/quake2/${mod}
				doins app/${mod}/*.pak
			fi
			if [[ -n $(ls app/${mod}/*.ico 2>/dev/null) ]] ; then
				insinto /usr/share/quake2/${mod}
				doins app/${mod}/*.ico
			fi
			if [[ -n $(ls app/${mod}/*.cfg 2>/dev/null) ]] ; then
				insinto /usr/share/quake2/${mod}
				doins app/${mod}/*.cfg
			fi
		fi
	done

	dodoc -r app/docs/*
	dodoc app/3.20_Changes.txt
	newdoc app/ctf/readme.txt ctf-readme.txt
}
