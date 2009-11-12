# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils java-pkg-2

DESCRIPTION="A nice tool to fill in PDF forms."
HOMEPAGE="http://www.cabaret-solutions.com"

SRC_URI="amd64? (cabaretstage_3.2.7_linux_x86-64.tar.gz)"

LICENSE="cabaret"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
RESTRICT="fetch"

DEPEND="
"

RDEPEND="${DEPEND}
	>=virtual/jre-1.4"

src_unpack() {
	unpack ${A}
	cd ${S}
	
}

src_install() {
	sed -i -e 's#cd ".*#cd /opt/cabaret#' cabaretstage.sh
	#sed -i -e '/cd /d' cabaretstage.sh
	#sed -i -e 's#./#/opt/cabaret/#' cabaretstage.sh
	#sed -i -e 's#path=bin#path=/opt/cabaret/bin#' cabaretstage.sh

	mkdir -p $D/opt/cabaret
	cp -r . "${D}"/opt/cabaret/
	
	dosym /opt/cabaret/cabaretstage.sh /usr/bin/cabaret 
}

src_compile() {
	: # empty
}
