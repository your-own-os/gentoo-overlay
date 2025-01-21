# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="Port of OpenAI's Whisper model in C/C++ "
HOMEPAGE="https://github.com/ggerganov/whisper.cpp"
EGIT_REPO_URI="https://github.com/ggerganov/whisper.cpp.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="blas cuda examples hip opencl sdl2 test"

DEPEND="blas? ( virtual/blas )
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	hip? ( sci-libs/hipBLAS:= )
	opencl? ( sci-libs/clblast:= )
	sdl2? ( media-libs/libsdl2:= )"
RDEPEND="${DEPEND}"
BDEPEND=""

# Enabling multiple may lead to build failures, whisper-cpp won't use more than one either way
REQUIRED_USE="?? ( blas cuda hip opencl )"

src_configure() {
	# Note: CUDA and HIP are currently untested. Build failures may occur.
	# Turning off examples causes errors during configure
	local mycmakeargs=(
		-DWHISPER_BUILD_EXAMPLES=ON
		-DWHISPER_BUILD_TESTS=$(usex test)
		-DWHISPER_BLAS=$(usex blas)
		-DWHISPER_CLBLAST=$(usex opencl)
		-DWHISPER_CUBLAS=$(usex cuda)
		-DWHISPER_HIPBLAS=$(usex hip)
		-DWHISPER_SDL2=$(usex sdl2)
	)
	#-DCMAKE_INSTALL_INCLUDEDIR=include/whisper-cpp
	#-DCMAKE_INSTALL_LIBDIR=lib64/whisper-cpp
	cmake_src_configure
}
