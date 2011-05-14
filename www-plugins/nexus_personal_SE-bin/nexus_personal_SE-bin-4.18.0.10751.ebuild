# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit eutils multilib

DESCRIPTION="Internet banking plugin for technology by BankID company"
SRC_URI="https://test.bankid.com/InstallBankidCom/InstallFiles/personal-${PV}.tar.gz"
HOMEPAGE="http://bankid.com/"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="as-is"

IUSE="doc"

RDEPEND="
	!amd64? ( 
		app-crypt/mit-krb5
		dev-libs/atk
		dev-libs/expat
		dev-libs/glib:2
		media-libs/libpng
		net-misc/curl[gnutls,kerberos]
		x11-libs/gtk+
		x11-libs/libSM
		x11-libs/libX11
		x11-libs/libXinerama
		x11-libs/pango
		virtual/jre )"
DEPEND="
	amd64? ( 
		www-plugins/nspluginwrapper
		app-emulation/emul-linux-x86-baselibs
		app-emulation/emul-linux-x86-xlibs )"

RESTRICT="strip"

QA_TEXTRELS="opt/${PN}/*.so"

S=${WORKDIR}/personal-${PV}

NSPLUGIN="/usr/lib32/nsbrowser/plugins/libnexuspersonal.so"

src_install() {
	local id=/opt/${PN}
	local ubin=/usr/local/bin
	local lib=$(get_abi_LIBDIR x86)

	exeinto ${id}
	doexe *.so personal.bin persadm || die "doexe failed."

	make_wrapper personal ${id}/personal.bin ${id} ${id} \
		|| die "make_wrapper failed."
	make_wrapper persadm "${id}/persadm" ${id} ${id} || die "make_wrapper failed."

	dosym /usr/bin/personal ${ubin}/personal || die "dosym failed."
	dosym /usr/bin/persadm ${ubin}/persadm || die "dosym failed."

	if use doc; then
		dohtml *.htm || die "dohtml failed."
		dodoc *.txt || die "dodoc failed."
	fi

	insinto ${id}/config
	doins Personal.cfg || die "doins failed."

	newicon nexus_logo_32x32.png ${PN}.png || die "newicon failed."
	dosym /usr/share/pixmaps/${PN}.png ${id}/icons/nexus_logo_32x32.png

	make_desktop_entry personal "Nexus Personal" ${PN} Utility

	dosym ${id}/libplugins.so "${NSPLUGIN}" || die "dosym failed."

	# Create the env.d entry
	echo "LDPATH=${id}" > 90nexus-personal
	doenvd 90nexus-personal

}

pkg_postinst() {
	if use amd64; then
		einfo "Installing 64-bit nsplugin wrapper"
		nspluginwrapper -i "${NSPLUGIN}"
	fi
}

pkg_postrm() {
	if use amd64; then
		NSW=$(nspluginwrapper -l |grep -m1 npwrapper.libnexuspersonal.so)
		if [ "x$NSW" != "x" ] ; then
			einfo "Removing nsplugin wrapper"
			nspluginwrapper -r "${NSW}"
		fi
	fi
}

