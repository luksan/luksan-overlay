# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/kdevelop/kdevelop-3.5.1.ebuild,v 1.2 2008/03/19 11:31:21 zlin Exp $

EGIT_REPO_URI="/home/lukas/Projects/kontrollerlab"
EGIT_PROJECT="kontrollerlab"
inherit kde eutils git
SRC_URI=""

DESCRIPTION="IDE for development of software for AVR microcontrollers."
HOMEPAGE="http://sourceforge.net/projects/kontrollerlab/"

LICENSE="GPL-2"

KEYWORDS="~amd64"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}
		dev-embedded/avrdude"

DEPEND="${DEPEND}
	"

need-kde 3.5

#MAKEOPTS="${MAKEOPTS} -j1"


src_unpack() {
	git_src_unpack

	#make -f Makefile.cvs
}

src_compile() {
	# The source is located in a sub-directory
	KDE_S="${S}/trunk"
	kde_src_compile 
}

src_install() {
	kde_src_install
}

pkg_postinst() {
	:
}
