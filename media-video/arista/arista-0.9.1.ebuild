# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/demjson/demjson-1.1.ebuild,v 1.2 2009/02/15 22:10:38 patrick Exp $

NEED_PYTHON=2.3

inherit distutils

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Userfriendly video transcoding frontend for GStreamer."
HOMEPAGE="http://programmer-art.org/projects/arista-transcoder"
SRC_URI="http://launchpad.net/arista/stable/${PV}/+download/${PN}-${PV}.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
IUSE="test"

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/gconf-python
	dev-python/gst-python
	>=x11-libs/gtk+-2.16
	dev-python/dbus-python
	>=dev-python/pycairo-1.8.2
	dev-python/pygobject
	dev-python/pygtk
	media-plugins/gst-plugins-ffmpeg
	media-libs/gst-plugins-base
	media-libs/gst-plugins-good
	media-libs/gst-plugins-bad
	media-libs/gst-plugins-ugly"

