# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="Port of Facebook's LLaMA model in C/C++"
HOMEPAGE="https://github.com/ggerganov/llama.cpp"
EGIT_REPO_URI="https://github.com/ggerganov/llama.cpp.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="lto blas cuda kompute mkl opencl openmp rocm vulkan examples tests tools"
CPU_FLAGS_X86=( avx avx2 f16c )

DEPEND="blas? (
		mkl? ( sci-libs/mkl )
		!mkl? ( sci-libs/openblas:= )
	)
	cuda? ( dev-util/nvidia-cuda-toolkit )
	opencl? ( virtual/opencl )
	rocm? ( sci-libs/hipBLAS )"
# dev-util/rocm-smi for rocm
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eapply "${FILESDIR}"/system-mkl.patch
	cmake_src_prepare
}

src_configure() {
	local blas=OFF
	local blas_vendor="Generic"
	if use blas; then
		blas=ON
		if use cuda ; then
			blas_vendor="NVHPC"
		elif use mkl ; then
			blas_vendor="Intel"
		fi
	fi

	local mycmakeargs=(
		-DGGML_LTO="$(usex lto)"
		-DGGML_BLAS=${blas}
		-DGGML_BLAS_VENDOR=${blas_vendor}
		-DGGML_CUDA="$(usex cuda)"
		-DGGML_HIP="$(usex rocm)"
		-DGGML_KOMPUTE=$(usex kompute)
		-DGGML_OPENCL=$(usex opencl)
		-DGGML_OPENMP=$(usex openmp)
		-DGGML_VULKAN=$(usex vulkan)
		-DLLAMA_BUILD_TESTS="$(usex tests)"
		-DLLAMA_BUILD_EXAMPLES="$(usex examples)"
		-DLLAMA_BUILD_SERVER=OFF
		-DCMAKE_BUILD_TYPE=Release
	)
	#	-DAMDGPU_TARGETS="$(get_amdgpu_flags)"
	#	-DCMAKE_SKIP_BUILD_RPATH=ON
	#	-DBUILD_NUMBER="1"

	if use cuda ; then
		addpredict /dev/nvidiactl
	fi
	cmake_src_configure
}
