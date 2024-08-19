class AniCli < Formula
  desc "A cli tool to browse and play anime"
  homepage "https://github.com/pystardust/ani-cli"
  license "GPL-3.0"
  head "https://github.com/pystardust/ani-cli.git"

  depends_on "curl"
  depends_on "grep"
  depends_on "aria2"
  depends_on "ffmpeg"
  depends_on "git"
  depends_on "fzf"
  depends_on "yt-dlp"

  def install
    system "mkdir", "-p", "#{prefix}/bin", "#{prefix}/share/man/man1"
    system "install", "-m0755", "ani-cli", "#{prefix}/bin/ani-cli"
    system "install", "-m0644", "ani-cli.1", "#{prefix}/share/man/man1/ani-cli.1"
  end
  
  def caveats
    <<~EOS
      ani-cli needs the cask "iina" to function on macos
    EOS
  end
end
