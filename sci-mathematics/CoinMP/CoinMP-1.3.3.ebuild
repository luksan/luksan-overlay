# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-editors/hteditor/hteditor-2.0.14.ebuild,v 1.1 2008/08/17 04:47:40 dragonheart Exp $

DESCRIPTION="C library for linear programming"
HOMEPAGE="https://projects.coin-or.org/CoinMP"
SRC_URI="http://www.coin-or.org/download/source/CoinMP/${P}.tgz"

LICENSE="CPL"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE="glpk"

RDEPEND=""
DEPEND="${RDEPEND}"

function coin_opt() {
	pkg=$1
	coin_conf="${coin_conf} --with-${pkg}-lib=-L/usr/lib\ -l${pkg} --with-${pkg}-incdir=/usr/include"
}

src_compile() {
	coin_conf=""
	if use glpk ; then
		coin_opt "glpk"
	fi
	eval econf $coin_conf
	emake || die "emake failed."
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
}
