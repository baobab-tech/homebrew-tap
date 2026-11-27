class Pmcpg < Formula
  desc "Private MCP Gateway: local-first gateway between AI clients and MCP servers"
  homepage "https://github.com/baobab-tech/pMCPg"
  version "0.1.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.7/pmcpg-0.1.7-darwin-arm64.tar.gz"
      sha256 "56dc5df257b5635653b164b8fee648292d7bdb26417769abf78e464e7a343b17"
    end
    on_intel do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.7/pmcpg-0.1.7-darwin-x64.tar.gz"
      sha256 "b73b16722d3915da20e4080360931639fff58aeed2a8fc4398859fa4ad7ea764"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.7/pmcpg-0.1.7-linux-arm64.tar.gz"
      sha256 "47a6125a8b956d82e920efbb1bbc47845637d84d721fd6e32c2beea6f9546044"
    end
    on_intel do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.7/pmcpg-0.1.7-linux-x64.tar.gz"
      sha256 "b19ee5cd0bea929006c30339b5c7f1dfe803a6bd163abb11e76e494b9d2be646"
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
