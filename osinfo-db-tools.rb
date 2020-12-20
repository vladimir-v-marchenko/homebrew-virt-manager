class OsinfoDbTools < Formula
  desc "Tools for managing the libosinfo database files"
  homepage "https://libosinfo.org"
  url "https://releases.pagure.org/libosinfo/osinfo-db-tools-1.8.0.tar.xz"
  sha256 "e9811a936e74dc262ce297ea7b8addeb111c782de500c9e285d3cdd5fe1b180d"

  depends_on "pkg-config" => :build

  depends_on "gettext"
  depends_on "glib"
  depends_on "json-glib"
  depends_on "libarchive"
  depends_on "libsoup"
  depends_on "ninja"
  depends_on "meson"

  def install
    args = %W[
      --disable-dependency-tracking
      --disable-silent-rules
      --prefix=#{prefix}
      --localstatedir=#{var}
      --sysconfdir=#{etc}
    ]
    system ".configure", *args
    system "/usr/local/bin/meson", "build"
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "#{bin}/osinfo-db-path"
  end
end
