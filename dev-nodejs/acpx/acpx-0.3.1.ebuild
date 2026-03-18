# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Headless CLI client for stateful Agent Client Protocol (ACP) sessions"
HOMEPAGE="https://github.com/openclaw/acpx"

NODEJS_DEPS_SRC_URI=""
SRC_URI="http://registry.npmjs.org/${PN}/-/${P}.tgz
         ${NODEJS_DEPS_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="net-libs/nodejs[npm]"
BDEPEND="dev-nodejs/cjs-ledger"

src_unpack() {
	mkdir --parents ${S}/registry
	for f in ${DISTDIR}/*.tgz; do
		ln --symbolic --verbose ${f} ${S}/registry/$(basename $f)
	done
}

src_compile() {
	cjs-ledger ${S}/registry --exec npm --cache=${WORKDIR}/.npm-cache --cache=./cache --no-audit install ${PN}@${PV} || die "Error running npm"
}

src_install() {
	dodir /usr/lib64/node_modules/${PN}
	cp -R "${S}/node_modules/" "${D}/usr/lib64/node_modules/${PN}"
	cp "${S}/package-lock.json" "${D}/usr/lib64/node_modules/${PN}/package.json"

	dosym ../lib64/node_modules/${PN}/node_modules/.bin/${PN} /usr/bin/${PN}
}
