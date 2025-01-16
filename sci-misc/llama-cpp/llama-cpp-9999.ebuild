# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ROCM_VERSION=5.5

inherit cmake llvm rocm

LLVM_MAX_SLOT=19

EGIT_REPO_URI="https://github.com/ggerganov/llama.cpp.git"
inherit git-r3

DESCRIPTION="Port of Facebook's LLaMA model in C/C++"
HOMEPAGE="https://github.com/ggerganov/llama.cpp"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="blas cublas lto tests tools rocm"
CPU_FLAGS_X86=( avx avx2 f16c )

DEPEND="blas? ( sci-libs/openblas:= )
	cublas? ( dev-util/nvidia-cuda-toolkit )
	rocm? ( sci-libs/rocBLAS )"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

S="${WORKDIR}/${P}"

src_configure() {
	if use rocm ; then
		CC=/usr/lib/llvm/${LLVM_MAX_SLOT}/bin/clang
		CXX=/usr/lib/llvm/${LLVM_MAX_SLOT}/bin/clang++
		export DEVICE_LIB_PATH=/usr/lib/amdgcn/bitcode
		export HIP_DEVICE_LIB_PATH=/usr/lib/amdgcn/bitcode
	fi
	local mycmakeargs=(
		-DLLAMA_BLAS="$(usex blas)"
		-DLLAMA_CUBLAS="$(usex cublas)"
		-DLLAMA_LTO="$(usex lto)"
		-DLLAMA_BUILD_TESTS="$(usex tests)"
		-DLLAMA_HIPBLAS="$(usex rocm)"
		-DAMDGPU_TARGETS="$(get_amdgpu_flags)"
		-DLLAMA_BUILD_SERVER=OFF
		-DCMAKE_SKIP_BUILD_RPATH=ON
		-DBUILD_NUMBER="1"
	)
	if use cublas ; then
		addpredict /dev/nvidiactl
	fi
	cmake_src_configure
}

src_install() {
	doheader include/*.h

	cd "${BUILD_DIR}" || die
	dolib.so src/*.so
	dolib.so ggml/src/*.so
	dobin bin/*
}
