# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Chez Scheme is an implementation of the R6RS"
HOMEPAGE="https://cisco.github.io/ChezScheme"

# List of source dependencies required for chez compilation.
# Tar files should be loaded beforehand or ./configure tries to
# fetch them in network-sandbox environment and fails.

v_zlib="1.2.11"
v_stex="1.2.1"
v_nano="1.9"

p_zlib="zlib-${v_zlib}"
p_stex="stex-${v_stex}"
p_nano="nanopass-framework-scheme-${v_nano}"

SRC_URI="
https://github.com/cisco/ChezScheme/archive/v${PV}.tar.gz -> ${PF}.tar.gz
https://github.com/nanopass/nanopass-framework-scheme/archive/v${v_nano}.tar.gz -> ${p_nano}.tar.gz
https://github.com/madler/zlib/archive/v${v_zlib}.tar.gz -> ${p_zlib}.tar.gz
https://github.com/dybvig/stex/archive/v${v_stex}.tar.gz -> ${p_stex}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86"
IUSE="+threads"

DEPEND="
	sys-libs/ncurses
	x11-libs/libX11
"
RDEPEND="${DEPEND}"

src_unpack () {
	unpack ${A}
	mv ChezScheme-${PV} ${PF}
	mv -T ${p_zlib} ${PF}/zlib
	mv -T ${p_stex} ${PF}/stex
	mv -T ${p_nano} ${PF}/nanopass
}

src_configure () {
	local use_threads
	if use threads ; then
		use_threads="--threads"
	fi

	./configure ${use_threads} \
		--installprefix=/usr \
		--installbin=/usr/bin \
		--installlib=/usr/lib \
		--installman=/usr/share/man \
		--temproot=${D}

	if [ ! -f "Makefile" ]; then
		die "Makefile is not created, terminating build"
	fi
}
