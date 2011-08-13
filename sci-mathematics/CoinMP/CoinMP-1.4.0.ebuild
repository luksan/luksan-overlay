# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="C library for linear programming"
HOMEPAGE="https://projects.coin-or.org/CoinMP"
SRC_URI="http://www.coin-or.org/download/source/CoinMP/${P}.tgz"

LICENSE="CPL"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE="debug glpk"

RDEPEND="glpk?  ( sci-mathematics/glpk )"
DEPEND="${RDEPEND}"

function coin_opt() {
	pkg=$1
	echo "--with-${pkg}-lib=\"-L/usr/lib -l${pkg}\" --with-${pkg}-incdir=/usr/include"
}

src_configure() {
	#FIXME: --with-blas and --with-lapack
	#FIXME: --with-wsmp

	#Use eval in order to solve tricky quoting problems with coin_opt()
	eval econf \
		--enable-shared \
		--enable-gnu-packages \
		use_enable debug \
		--disable-cplex-libcheck \
		$(use glpk && coin_opt "glpk")
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
}
