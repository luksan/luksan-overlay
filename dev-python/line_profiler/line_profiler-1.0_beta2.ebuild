# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

SUPPRT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

MY_PV="${PV/_beta/b}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Line-by-line profiler."
HOMEPAGE="http://packages.python.org/line_profiler"
SRC_URI="http://pypi.python.org/packages/source/l/line_profiler/${MY_P}.tar.gz"
LICENSE="BSD-2"
KEYWORDS="amd64"
SLOT="0"
IUSE=""
S="${WORKDIR}/${MY_P}"

