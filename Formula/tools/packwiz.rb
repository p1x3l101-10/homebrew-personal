class Packwiz < Formula
  desc "A command line tool for editing and distributing Minecraft modpacks, using a git-friendly TOML format. Supports CurseForge and Modrinth mods with automated updates!"
  homepage "https://github.com/packwiz/packwiz"
  head "https://github.com/packwiz/packwiz.git",
    branch: "main"
  license "MIT"

  depends_on "go" => :build
  uses_from_macos "bash" => :build

  def install
    system "mkdir", "completions"
    system "go", "build", "-ldflags", "-linkmode=external", "-trimpath", "-o", "packwiz"
    system "bash", "-c", "./packwiz completion bash > completions/packwiz.bash"
    system "bash", "-c", "./packwiz completion zsh > completions/packwiz.zsh"
    system "bash", "-c", "./packwiz completion fish > completions/packwiz.fish"
    system "mkdir", "-p", "#{bin}", "#{share}/packwiz", "#{share}/bash-completion/completions", "#{share}/zsh/site-functions", "#{share}/fish/vendor_completions.d"
    system "install", "-m755", "packwiz", "#{bin}/packwiz"
    system "install", "-m644", "LICENSE", "#{share}/packwiz/LICENSE"
    system "install", "-m644", "completions/packwiz.bash", "#{share}/bash-completion/completions/packwiz"
    system "install", "-m644", "completions/packwiz.zsh",  "#{share}/zsh/site-functions/_packwiz"
    system "install", "-m644", "completions/packwiz.fish", "#{share}/fish/vendor_completions.d/packwiz.fish"
  end

  test do
    raise "Test not implemented."
  end
end
