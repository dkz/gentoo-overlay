# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# TODO: installs under /usr/local instead of /usr/bin
#	thus causing a user warning during emerging.

EAPI=7

DESCRIPTION="Switch your X keyboard layouts from the command line"
HOMEPAGE="https://github.com/ierton/xkb-switch"
SRC_URI="https://github.com/ierton/xkb-switch/archive/1.6.0.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="x11-libs/libxkbfile"
RDEPEND="${DEPEND}"
BDEPEND=""

MY_BUILDDIR="${S}/build"

src_configure () {
	mkdir -p ${MY_BUILDDIR}
	cd ${MY_BUILDDIR}
	cmake .. || die "cmake failed"
}

src_compile () {
	cd ${MY_BUILDDIR}
	emake || die "emake failed"
}

src_install () {
	cd ${MY_BUILDDIR}
	emake DESTDIR="${D}" install
}
