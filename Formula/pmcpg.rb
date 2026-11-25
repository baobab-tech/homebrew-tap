class Pmcpg < Formula
  desc "Private MCP Gateway: local-first gateway between AI clients and MCP servers"
  homepage "https://github.com/baobab-tech/pMCPg"
  version "0.1.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.6/pmcpg-0.1.6-darwin-arm64.tar.gz"
      sha256 "6b1a3336f98be9fdaaa947f83104e6bc0943c6be2e3926f84014286c82591f6b"
    end
    on_intel do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.6/pmcpg-0.1.6-darwin-x64.tar.gz"
      sha256 "469fc25d321321990e31e26949ad6909e352a7b509f34d04bb240d16fbded441"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.6/pmcpg-0.1.6-linux-arm64.tar.gz"
      sha256 "5b66a2e5f22b048cbaffb384a130ae41481a8c324e1aa907a354e0497c02a3a9"
    end
    on_intel do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.6/pmcpg-0.1.6-linux-x64.tar.gz"
      sha256 "b55d7ace6af0dc469e02771e4d064494067dc1480775d3e60973cd6609d927d4"
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
