# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/axiom/axiom-0.5.27.ebuild,v 1.2 2008/04/03 21:44:49 lordvan Exp $

inherit distutils eutils

MY_P="PuLP-${PV}"

DESCRIPTION="puLP: An LP modeler in Python"
HOMEPAGE="http://code.google.com/p/pulp-or/"
SRC_URI="http://pulp-or.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~ia64 ~ppc64 ~x86 ~amd64"
IUSE="examples"

DEPEND=">=dev-lang/python-2.5"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

DOCS=""

EXAMPLES="pulp-or/examples/*"

src_unpack() {
	distutils_src_unpack
}

#src_compile() {
#	# skip this, or epsilon will install the temporary "build" dir
#	true
#}

src_install() {
	distutils_src_install

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r pulp-or/examples
	fi
}

#src_test() {
#	PYTHONPATH=. trial axiom || die "trial failed"
#}
