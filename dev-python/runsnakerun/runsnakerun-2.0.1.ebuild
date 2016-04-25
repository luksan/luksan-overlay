# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils-r1

MY_PN="RunSnakeRun"
MY_PV="${PV/_beta/b}"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="GUI Viewer for Python profiling runs"
HOMEPAGE="http://www.vrplumber.com/programming/runsnakerun/"
SRC_URI="http://pypi.python.org/packages/source/R/RunSnakeRun/${MY_P}.zip"
LICENSE="BSD-2"
KEYWORDS="amd64"
SLOT="0"
IUSE=""
S="${WORKDIR}/${MY_P}"
DEPEND="app-arch/unzip
	dev-python/setuptools
	dev-python/squaremap"
