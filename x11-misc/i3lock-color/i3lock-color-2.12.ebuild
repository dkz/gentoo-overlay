# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# TODO: x11-misc/i3lock must be unmerged before attempting
#	to install this package.

EAPI=7

DESCRIPTION="Ricing fork of simple screen locker"
HOMEPAGE="https://github.com/PandorasFox/i3lock-color"
SRC_URI="https://github.com/PandorasFox/i3lock-color/archive/${PV}.c.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	dev-util/pkgconf
	x11-libs/libxcb
	media-libs/fontconfig
	dev-libs/libev
	x11-libs/libX11
	x11-libs/libxkbcommon
	media-libs/libjpeg-turbo
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}.c"

src_configure () {
	autoreconf --force --install
	econf --disable-sanitizers
}
