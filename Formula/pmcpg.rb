class Pmcpg < Formula
  desc "Private MCP Gateway: local-first gateway between AI clients and MCP servers"
  homepage "https://github.com/baobab-tech/pMCPg"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.1/pmcpg-0.1.1-darwin-arm64.tar.gz"
      sha256 "a26e548c31e8f65691d49d38c9be1e9932eb00340599d95a6e83a1a4e5b75b30"
    end
    on_intel do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.1/pmcpg-0.1.1-darwin-x64.tar.gz"
      sha256 "776645387a9278cbe29b8845a42db59be0dd1992211bc370e25c96e9d7228a58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.1/pmcpg-0.1.1-linux-arm64.tar.gz"
      sha256 "eb1005596abaf2604cd376ae0b7fe9334a1bd11bc4d628c432458c9422e18f96"
    end
    on_intel do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.1/pmcpg-0.1.1-linux-x64.tar.gz"
      sha256 "b32ae3f417bb2599323e75a01e8b241acf3eabc8180c6ad4f8f6fa2566ec11e6"
    end
  end

  def install
    bin.install "pmcpg"
  end

  service do
    run [opt_bin/"pmcpg", "serve"]
    keep_alive successful_exit: false
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/pmcpg version").strip
  end
end
