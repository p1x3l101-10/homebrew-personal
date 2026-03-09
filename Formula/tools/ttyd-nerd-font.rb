class TtydNerdFont < Formula
  desc "A forked version of ttyd having built-in web font and nerd symbol support."
  homepage "https://github.com/metorm/ttyd-nerd-font"
  license "MIT"
  revision 8
  head "https://github.com/metorm/ttyd-nerd-font.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "json-c"
  depends_on "libevent"
  depends_on "libuv"
  depends_on "libwebsockets"
  depends_on "openssl@3"

  uses_from_macos "vim" # needed for xxd

  conflicts_with "ttyd", because: "this is the same project, just with a different font set built in" # Specify that this is still ttyd

  on_linux do
    depends_on "zlib-ng-compat"
  end

  def install
    system "cmake", "-S", ".", "-B", "build",
                    "-DOPENSSL_ROOT_DIR=#{Formula["openssl@3"].opt_prefix}",
                    "-Dlibwebsockets_DIR=#{Formula["libwebsockets"].opt_lib}/cmake/libwebsockets",
                    "-DCMAKE_POLICY_VERSION_MINIMUM=3.5",
                    *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    port = free_port
    fork do
      system bin/"ttyd", "--port", port.to_s, "-t", "fontSize=16", "-t" "fontFamily=\"JetBrains, SarasaMono, Serif\"", "bash"
    end
    output = shell_output("curl --silent --retry 5 --retry-connrefused http://localhost:#{port}")
    assert_match "<title>ttyd - Terminal</title>", output[..256]
  end
end
