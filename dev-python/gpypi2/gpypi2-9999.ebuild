# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils distutils mercurial

DESCRIPTION="creates ebuilds for Gentoo Linux from Python Package Index"
HOMEPAGE="http://docs.fubar.si/gpypi2/"
EHG_REPO_URI="http://bitbucket.org/iElectric/g-pypi2/"
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="test doc"

DEPEND="dev-python/unittest2
	dev-python/jinja
	dev-python/yolk
	dev-python/pygments
	virtual/python-argparse
	>=dev-python/jaxml-3.02
	app-portage/gentoolkit
	app-portage/gentoolkit-dev
	>=app-portage/metagen-0.5.2
	test? ( dev-python/nose )
	test? ( dev-python/mock )
	test? ( dev-python/scripttest )
	doc? ( dev-python/sphinx )"

# Run-time dependencies. Must be defined to whatever this depends on to run.
# The below is valid if the same run-time depends are required to compile.
RDEPEND="${DEPEND}"

S="${WORKDIR}/g-pypi2/"
