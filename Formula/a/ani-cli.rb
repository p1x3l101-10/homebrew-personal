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
    # Install required cask
    system "/usr/bin/env", "brew", "install", "--cask", "iina"
    system "gmkdir", "-p", "#{prefix}/bin", "#{prefix}/share/man/man1"
    system "ginstall", "-m0755", "ani-cli", "#{prefix}/bin/ani-cli"
    system "ginstall", "-m0644", "ani-cli.1", "#{prefix}/share/man/man1/ani-cli.1"
  end
  
  def uninstall
      # Uninstall required cask
    system "/usr/bin/env", "brew", "uninstall", "--cask", "iina"
  end
end
