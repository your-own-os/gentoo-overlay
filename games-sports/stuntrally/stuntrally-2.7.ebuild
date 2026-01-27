# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

[[ ${PV} = 9999* ]] && GIT="git-r3"

inherit cmake ${GIT}

DESCRIPTION="Rally game focused on closed rally tracks with possible stunt elements."
HOMEPAGE="http://stuntrally.tuxfamily.org/"

SLOT="0"
LICENSE="GPL-3"
IUSE="dedicated +game editor"

if [[ ${PV} = 9999* ]]; then
	SRC_URI=""
	KEYWORDS=""
	EGIT_REPO_URI="mirror://github/stuntrally/stuntrally"
	LIVE_PDEPEND="=${CATEGORY}/${PN}-tracks-${PV}"
else
	KEYWORDS="~amd64 ~x86"
	SRC_URI="mirror://github/${PN}/${PN}/archive/${PV}.tar.gz -> ${P}.tgz
	         mirror://github/stuntrally/tracks/archive/${PV}.tar.gz -> stuntrally-trakcs-${PV}.tar.gz"
fi

#		dev-games/ogre[cg,boost,ois,freeimage,opengl,zip,-double-precision]
DEPEND="
	game? (
		dev-games/ogre[freeimage,opengl]
		dev-games/mygui[ogre,plugins]
		media-libs/libsdl2[haptic]
		media-libs/libvorbis
		media-libs/libogg
		media-libs/openal
		sci-physics/bullet
	)
	dev-libs/boost
	net-libs/enet:1.3
	dev-libs/tinyxml
	dev-libs/tinyxml2
"
RDEPEND="${DEPEND}
	~games-sports/stuntrally-tracks-${PV}
"
PDEPEND="${LIVE_PDEPEND}"

REQUIRED_USE="editor? ( game )"

DOCS=(Readme.txt)

src_configure() {
	local mycmakeargs=(
		-DBUILD_MASTER_SERVER=$(usex dedicated)
		-DBUILD_GAME=$(usex game)
		-DBUILD_EDITOR=$(usex editor)
		-DBUILD_SHARED_LIBS=OFF
		-DSHARE_INSTALL="share/stuntrally"
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
}
