# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit flag-o-matic eutils

DESCRIPTION="GNU Radio"
LICENSE="GPL-2"
HOMEPAGE="http://www.gnuradio.org/trac"
SRC_URI="ftp://ftp.gnu.org/gnu/gnuradio/${P}.tar.gz"
SLOT="0"
IUSE="alsa comedi debug doc dot examples fortran grc jack oss portaudio sdl usb usrp usrp2 wxwindows qt4"
KEYWORDS="x86 amd64"

DEPEND=">=dev-lang/python-2.5
	>=dev-lang/swig-1.3.31
	>=dev-util/pkgconfig-0.18
	>=sci-libs/fftw-3.0
	>=dev-util/cppunit-1.9.14
	>=dev-libs/boost-1.35
	>=sci-libs/gsl-1.10
	>=dev-scheme/guile-1.8.4
	>=dev-python/numpy-1.3.0
	alsa? ( media-libs/alsa-lib
   	        media-sound/alsa-headers )
	comedi? ( >=sci-electronics/comedilib-0.7 )
	doc? ( 	dot? ( >=app-doc/doxygen-1.5.7.1[-nodot] )
			>=app-doc/doxygen-1.5.7.1
			>=app-text/xmlto-0.0.22 )
	grc? ( 	>=dev-python/cheetah-2.0
			>=dev-python/lxml-2.0
			>=dev-python/pygtk-2.10 )
	jack? ( media-sound/jack-audio-connection-kit )
	portaudio? ( >=media-libs/portaudio-19 )
	qt4? ( 	dev-python/PyQt4
			x11-libs/qt-core
			x11-libs/qt-gui
			x11-libs/qt-opengl
			x11-libs/qwt:5
			>=x11-libs/qwtplot3d-0.2.6-r2 )
	sdl? ( media-libs/libsdl )
	usb? ( dev-libs/libusb )
	usrp? (	>=dev-embedded/sdcc-2.8.0
			virtual/libusb:0 )
	wxwidgets? ( dev-python/wxpython:2.8 )"

src_configure() {
	local myconf=""
	
	if ! use sdl ; then
		myconf="$myconf --disable-sdltest"
	fi

	# PS3 cell support is disabled, change the ebuild if you want it
	# usrp2 firmware requires a gcc toolchain for the Mirco Blaze arch
	econf \
		--enable-gnuradio-core \
		--disable-gr-audio-windows \
		--disable-gr-audio-osx \
		--disable-gcell \
		--disable-gr-gcell \
		--disable-usrp2-firmware \
		$(use_enable alsa gr-audio-alsa) \
		$(use_enable doc doxygen) \
		$(use_enable dot) \
		$(use_enable comedi gr-comedi) \
		$(use_with debug) \
		$(use_enable usrp) \
		$(use_enable usrp2) \
		$(use_enable fortran) \
		$(use_enable jack gr-audio-jack) \
		$(use_enable oss gr-audio-oss) \
		$(use_enable portaudio gr-audio-portaudio) \
		$(use_enable wxwindows gr-wxgui) \
		$(use_enable sdl gr-video-sdl) \
		$(use_enable qt4 gr-qtgui) \
		$(use_with qt4 "qwt-incdir=/usr/include/qwt5") \
		$myconf \
		|| die "econf failed"
}

src_test()
{
	emake check || die "emake check failed"
}

src_install() {
	emake install || die "emake install failed"

	# Install examples
	if use examples ; then
	        mkdir -p ${D}/usr/share/doc/${PF}/examples/
	        cp -r gnuradio-examples/* ${D}/usr/share/doc/${PF}/examples/
	fi
}

