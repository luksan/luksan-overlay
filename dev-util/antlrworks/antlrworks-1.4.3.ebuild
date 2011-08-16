# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/antlrworks/antlrworks-1.2.3.ebuild,v 1.7 2009/12/29 17:36:20 josejx Exp $

EAPI="4"

inherit java-pkg-2 java-ant-2

DESCRIPTION="A novel grammar development environment for ANTLR v3 grammars"
HOMEPAGE="http://www.antlr.org/works/index.html"
SRC_URI="http://www.antlr.org/download/${P}-src.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"

IUSE=""

COMMON_DEP="
	dev-java/stringtemplate:0
	>=dev-java/antlr-3.3:3
	dev-java/jgoodies-forms:0"

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip
	${COMMON_DEP}"

S="${WORKDIR}"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_GENTOO_CLASSPATH="stringtemplate,antlr,antlr-3,jgoodies-forms"
EANT_BUILD_TARGET="build"

java_prepare() {
	epatch "${FILESDIR}/antlrworks-1.4.2.patch"
	rm -vr src/aw/org/antlr/xjlib/appkit/app/MacOS/ || die
	rm -v lib/*.jar || die
	find  -name "*.class" -print -delete || die
}

src_install() {
	java-pkg_newjar "dist/${P}.jar"

	java-pkg_dolauncher ${PN} --main "org.antlr.works.IDE"
	
	newicon "resources/icons/app.png" 	"${PN}_128.png"
	newicon "resources/icons/app_64x64.png"	"${PN}_64.png"
	newicon "resources/icons/app_32x32.png" "${PN}_32.png"
	newicon "resources/icons/app_16x16.png" "${PN}_16.png"

	make_desktop_entry ${PN} "ANTLRWorks ${PV}" ${PN}_32 Development
}
