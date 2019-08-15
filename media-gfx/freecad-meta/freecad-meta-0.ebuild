# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit cmake-utils eutils xdg-utils gnome2-utils fortran-2 python-single-r1

DESCRIPTION="All the dependencies required for FreeCAD development"
HOMEPAGE="https://www.freecadweb.org/"

KEYWORDS="amd64 x86"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

#dev-qt/qtgui:4[-egl] and dev-qt/qtopengl:4[-egl] : Bug 564978
#dev-python/pyside[svg] : Bug 591012
COMMON_DEPEND="
	${PYTHON_DEPS}
	dev-cpp/eigen:3
	dev-java/xerces
	dev-libs/boost:=[python,${PYTHON_USEDEP}]
	dev-libs/xerces-c[icu]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/pyside:0[X,svg,${PYTHON_USEDEP}]
	dev-python/shiboken:0[${PYTHON_USEDEP}]
	dev-qt/designer:4
	dev-qt/qtgui:4[-egl]
	dev-qt/qtopengl:4[-egl]
	dev-qt/qtsvg:4
	dev-qt/qtwebkit
	media-libs/coin
	media-libs/freetype
	sci-libs/opencascade:*[vtk(+)]
	sci-libs/orocos_kdl
	sys-libs/zlib
	virtual/glu"
RDEPEND="${COMMON_DEPEND}
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pivy[${PYTHON_USEDEP}]
	dev-qt/assistant:4"
DEPEND="${COMMON_DEPEND}
	>=dev-lang/swig-2.0.4-r1:0
	dev-python/pyside-tools:0[${PYTHON_USEDEP}]"

# TODO:
#   DEPEND and RDEPEND:
#		salome-smesh - science overlay
#		zipio++ - not in portage yet


