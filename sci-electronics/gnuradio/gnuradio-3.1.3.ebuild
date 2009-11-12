# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit flag-o-matic eutils

DESCRIPTION="GNU Radio"
LICENSE="GPL-2"
HOMEPAGE="http://www.gnuradio.org/trac"
SRC_URI="ftp://ftp.gnu.org/gnu/gnuradio/${P}.tar.gz"
SLOT="0"
IUSE="alsa comedi debug doc examples fortran jack oss portaudio sdl usb usrp wxwindows"
KEYWORDS="x86 amd64"

DEPEND="virtual/libc
	>=dev-lang/python-2.3
	>=dev-lang/swig-1.3.31
	dev-util/pkgconfig
	>=sci-libs/fftw-3.0
	>=dev-util/cppunit-1.9.14
	>=dev-libs/boost-1.34.1
	dev-python/numpy
	wxwidgets? ( >=dev-python/wxpython-2.5.2.7 )
	alsa? ( media-libs/alsa-lib
   	        media-sound/alsa-headers )
	comedi? ( >=sci-electronics/comedilib-0.7 )
	usb? ( dev-libs/libusb )
	sdl? ( media-libs/libsdl )
	usrp? ( >=dev-embedded/sdcc-2.5.6 
		>=dev-scheme/guile-1.8.4 )
	doc? ( app-doc/doxygen
	       app-text/xmlto )
	jack? ( media-sound/jack-audio-connection-kit )
	portaudio? ( >=media-libs/portaudio-19 )"

pkg_setup() {
	:
}

src_unpack() {
	unpack ${A}
	cd "${S}"
}


src_compile() {
	local myconf=""
	
	if ! use sdl ; then
		myconf="$myconf --disable-sdltest"
	fi

	econf \
		--enable-gnuradio-core \
		--disable-gr-audio-windows \
		--disable-gr-audio-osx \
		$(use_enable alsa gr-audio-alsa) \
		$(use_enable doc doxygen) \
		$(use_enable comedi gr-comedi) \
		$(use_with debug) \
		$(use_enable usrp) \
		$(use_enable fortran) \
		$(use_enable jack gr-audio-jack) \
		$(use_enable oss gr-audio-oss) \
		$(use_enable portaudio gr-audio-portaudio) \
		$(use_enable wxwindows gr-wxgui) \
		$(use_enable sdl gr-video-sdl) \
		$myconf \
		|| die "econf failed"

	emake || die "emake failed"
}

src_test()
{
	emake check || die "make check failed"
}

src_install() {
	make install DESTDIR="${D}" || die "make install failed"

	# Install examples
	if use examples ; then
	        mkdir -p ${D}/usr/share/doc/${PF}/examples/
	        cp -r gnuradio-examples/* ${D}/usr/share/doc/${PF}/examples/
	fi
}

