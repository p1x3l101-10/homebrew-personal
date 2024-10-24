require "language/node"

class Arrpc < Formula
  desc "Open Discord RPC server for atypical setups "
  homepage "https://arrpc.openasar.dev"
  version "3.5.0"
  url "https://github.com/OpenAsar/arrpc/archive/refs/tags/#{version}.tar.gz"
  sha256 "85f3c52b035af322789c749ad3910aca350d057ce97c98965bbf922acc74c68b"
  license "MIT"

  livecheck do
    url :stable
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  service do
    run bin/"arrpc"
    log_path var/"log/arrpc.log"
    error_log_path var/"log/arrpc.log"
  end

  test do
    raise "Test not implemented."
  end
end