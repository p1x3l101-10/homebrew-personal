class AniCli < Formula
  desc "A cli tool to browse and play anime"
  homepage "https://github.com/pystardust/ani-cli"
  license "GPL-3.0"
  version "4.9"
  url "https://github.com/pystardust/ani-cli/archive/refs/tags/v#{version}.tar.gz"
  sha256 "bdd5e3c264ab67760b13d34174ec86c3da3aaaaacda3ba529d8b2648bce2ef08"

  head "https://github.com/pystardust/ani-cli.git"

  depends_on "curl"
  depends_on "grep"
  depends_on "aria2"
  depends_on "ffmpeg"
  depends_on "git"
  depends_on "fzf"
  depends_on "yt-dlp"

  def install
    bin.install "ani-cli"
    man1.install "ani-cli.1"
  end
  
  def caveats
    <<~EOS
      'ani-cli' needs the cask "iina" to function on macos
      Install with:

      `brew install --cask iina`
    EOS
  end
end
