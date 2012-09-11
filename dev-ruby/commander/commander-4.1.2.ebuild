# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18"

inherit ruby-fakegem

DESCRIPTION="Toolkit for making command line tools in Ruby"
HOMEPAGE="https://rubygems.org/gems/commander"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~ppc64 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

ruby_add_rdepend ">=dev-ruby/highline-1.6.11"
