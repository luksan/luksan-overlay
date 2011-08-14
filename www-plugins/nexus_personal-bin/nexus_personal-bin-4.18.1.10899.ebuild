# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
inherit eutils multilib

remote_basename="BISP-${PV}"

DESCRIPTION="Internet banking plugin for technology by BankID"
SRC_URI="https://test.bankid.com/InstallBankidCom/InstallFiles/${remote_basename}.tar.gz -> nexus_personal-bin-${PV}.tar.gz"
HOMEPAGE="http://bankid.com/"

KEYWORDS="-* ~amd64 ~x86"
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
		virtual/jre )
	amd64? (
		www-plugins/nspluginwrapper
		app-emulation/emul-linux-x86-baselibs
		app-emulation/emul-linux-x86-xlibs )
	"

DEPEND="amd64? ( www-plugins/nspluginwrapper )"

RESTRICT="mirror strip"

QA_PREBUILT="opt/${PN}/*.so"

S=${WORKDIR}/${remote_basename}

INSTALL_BASE="${ROOT}opt/${PN}"
NSPLUGIN="${ROOT}usr/lib32/nsbrowser/plugins/libnexuspersonal.so"

src_install() {
	local ubin=/usr/local/bin
	local lib=$(get_abi_LIBDIR x86)

	exeinto ${INSTALL_BASE}
	doexe *.so personal.bin persadm

	make_wrapper personal "${INSTALL_BASE}/personal.bin" ${INSTALL_BASE} ${INSTALL_BASE}
	make_wrapper persadm "${INSTALL_BASE}/persadm" ${INSTALL_BASE} ${INSTALL_BASE}

	dosym /usr/bin/personal ${ubin}/personal
	dosym /usr/bin/persadm ${ubin}/persadm

	if use doc; then
		dohtml *.htm
		dodoc *.txt
	fi

	insinto ${INSTALL_BASE}/config
	doins Personal.cfg

	newicon nexus_logo_32x32.png ${PN}.png
	dosym "${ROOT}/usr/share/pixmaps/${PN}.png" "${INSTALL_BASE}/icons/nexus_logo_32x32.png"

	make_desktop_entry personal "Nexus Personal" ${PN} Utility

	dosym "${INSTALL_BASE}/libplugins.so" "${NSPLUGIN}"

	# Create the env.d entry
	echo "LDPATH=${INSTALL_BASE}" > 90nexus-personal
	doenvd 90nexus-personal

}

pkg_postinst() {
	if use amd64; then
		einfo "Installing 64-bit nsplugin wrapper"
		# FIXME: If this is the first time Nexus is installed on the system,
		# nspluginwrapper won't find the required shared libraries.
		nspluginwrapper -v -i "${NSPLUGIN}" ||
			elog "Run 'nspluginwrapper -v -i \"${NSPLUGIN}\"' to install the plugin."
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
