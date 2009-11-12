# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils rpm

DESCRIPTION="Parametric 3D CAD tool"

HOMEPAGE="http://foo.bar.com/"

SRC_URI="VariCAD_2008-en-3.04-1.x86_64.rpm"

LICENSE="x"

SLOT="0"

KEYWORDS="amd64"

RESTRICT="fetch"

DEPEND=""

RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	cp -r ${S}/* ${D}
}
