# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORTS_PYTHON_ABIS=1

PYTHON_MODNAME="pygraph"

inherit distutils

DESCRIPTION="A library for working with graphs in Python"
HOMEPAGE="http://code.google.com/p/python-graph/"
SRC_URI="http://python-graph.googlecode.com/files/${P}.tar.bz2"
LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""
DEPEND="dev-python/setuptools"
RDEPEND="media-gfx/pydot"

DISTUTILS_SETUP_FILES=( "core|setup.py" "dot|setup.py" )

src_test() {
	emake test || die "tests failed"
}
