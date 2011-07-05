# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

PYTHON_DEPEND="2"
DISTUTILS_SRC_TEST="setup.py"
PYTHON_MODNAME="rbtools"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Review Board tools"
HOMEPAGE="http://www.reviewboard.org"
SRC_URI="http://downloads.reviewboard.org/releases/${PN}/${PV:0:3}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="|| ( >=dev-lang/python-2.6 dev-python/simplejson )"
RDEPEND="${DEPEND}"
