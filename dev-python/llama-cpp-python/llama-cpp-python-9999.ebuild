# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 git-r3

DESCRIPTION="Python bindings for the llama.cpp library"
HOMEPAGE="https://github.com/abetlen/llama-cpp-python"
EGIT_REPO_URI="mirror://github/abetlen/llama-cpp-python.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="examples server"

RDEPEND="
	sci-misc/llama-cpp
	>=dev-python/typing-extensions-4.5.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.20.0[${PYTHON_USEDEP}]
	>=dev-python/diskcache-5.6.1[${PYTHON_USEDEP}]
	server? (
		dev-python/uvicorn
		dev-python/fastapi
		>=dev-python/pydantic-2.0
		dev-python/pydantic-settings
		dev-python/sse-starlette
		dev-python/starlette-context
	)
"
BDEPEND="
	test? (
		>=dev-python/httpx-0.24.1[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.10[${PYTHON_USEDEP}]
	)
"
# >=dev-python/jinja2-2.11.3[${PYTHON_USEDEP}]

distutils_enable_tests pytest

src_prepare() {
	default

	if ! use examples ; then
		rm -R examples
	fi

	# Remove the vendor as it has its own Ebuild
	rm -R vendor
	sed -i -e '/option.*/d' CMakeLists.txt || die

	# use Gentoo /usr/lib64
	sed -i 's/_base_path = pathlib.*/_base_path = pathlib.Path("\/usr\/lib64\")/g' llama_cpp/llama_cpp.py

	distutils-r1_src_prepare
}
