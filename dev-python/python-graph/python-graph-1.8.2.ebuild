# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="A library for working with graphs in Python"
HOMEPAGE="http://code.google.com/p/python-graph/"
SRC_URI="http://python-graph.googlecode.com/files/${P}.zip"
LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""
DEPEND="dev-python/setuptools"
RDEPEND="media-gfx/pydot
	virtual/pyparsing"
S="${WORKDIR}/python-graph/"

DISTUTILS_SETUP_FILES=( "core|setup.py" "dot|setup.py" )

src_test() {
	emake test || die "tests failed"
}
