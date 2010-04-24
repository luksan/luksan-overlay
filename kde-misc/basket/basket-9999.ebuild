# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit kde4-base git

DESCRIPTION="A DropDrawers clone. Multiple information organizer"
HOMEPAGE="http://basket.kde.org/"
#EGIT_REPO_URI="git://github.com/kelvie/basket.git"
EGIT_REPO_URI="/home/lukas/Projects/basket"

LICENSE="GPL-2"
KEYWORDS=""
SLOT="4"
IUSE="debug"

src_unpack() {
	git_src_unpack
}
