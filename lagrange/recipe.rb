class Lagrange < FPM::Cookery::Recipe
  name "lagrange"
  version "0.9.0"
  revision "1"

  maintainer "Dave Wongillies <dave.gillies@gmail.com>"
  license "MIT"

  homepage "https://gmi.skyjake.fi/#{name}"
  source "https://git.skyjake.fi/skyjake/#{name}",
    :with => "git",
    :submodule => true,
    :tag => "v#{version}"

  description "A Beautiful Gemini Client"

  build_depends "cmake",
    "libmpg123-dev",
    "libpcre3-dev",
    "libsdl2-dev",
    "libssl-dev",
    "libunistring-dev",
    "zlib1g-dev"

  depends \
    "libsdl2-2.0-0",
    "zlib1g",
    "libmpg123-0",
    "libpcre3",
    "libssl1.1",
    "libunistring2"

  def build
    safesystem "cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr"
    safesystem "cmake --build ."
  end

  def install
    bin.install name
    share("applications").install "fi.skyjake.lagrange.desktop"
    share("icons/hicolor/256x256/apps").install "res/lagrange-256.png", "fi.skyjake.lagrange.png"
    share("lagrange").install "resources.binary"
  end
end
