# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils-r1

MY_PN="SquareMap"
MY_PV="${PV/_beta/b}"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="Hierarchic data-visualisation control for wxPython"
HOMEPAGE="https://launchpad.net/squaremap"
SRC_URI="http://pypi.python.org/packages/source/S/SquareMap/${MY_P}.zip"
LICENSE="BSD-2"
KEYWORDS="amd64"
SLOT="0"
IUSE=""
S="${WORKDIR}/${MY_P}"
DEPEND="app-arch/unzip
	dev-python/setuptools"
