# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils java-pkg-2

DESCRIPTION="A nice tool to fill in PDF forms."
HOMEPAGE="http://www.cabaret-solutions.com"

SRC_URI="
	x86? ( http://www.cabaret-solutions.com/misc/downloads/cabaretstage_${PV}_linux-gtk-x86.tar.gz )
	amd64? ( http://www.cabaret-solutions.com/misc/downloads/cabaretstage_${PV}_linux-gtk-x86_64.tar.gz )
	"

LICENSE="cabaret"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
"

RDEPEND="${DEPEND}
	>=virtual/jre-1.5
	amd64? ( >=virtual/jre-1.6 )"

BASE_INSTALL_DIR="${ROOT}/opt/cabaretstage"

java_prepare() {
	sed -i -e "s#^BASEDIR.*#BASEDIR='${BASE_INSTALL_DIR}'#" bin/cabaretstage.sh
	sed -i -e "s#^BINDIR.*#BINDIR='${BASE_INSTALL_DIR}/bin'#" bin/cabaretstage.sh
}

src_compile() {
	: # empty
}

src_install() {

	mkdir -p "${D}/${BASE_INSTALL_DIR}" || die "mkdir failed"
	cp -r . "${D}/${BASE_INSTALL_DIR}" || die "copy failed"

	dosym "${BASE_INSTALL_DIR}/bin/cabaretstage.sh" "/usr/bin/cabaretstage"
}
