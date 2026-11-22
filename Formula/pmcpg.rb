class Pmcpg < Formula
  desc "Private MCP Gateway: local-first gateway between AI clients and MCP servers"
  homepage "https://github.com/baobab-tech/pMCPg"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.2/pmcpg-0.1.2-darwin-arm64.tar.gz"
      sha256 "6a360dbce77727f6027af315dd2af0bc02d336817512cb074441031423552b02"
    end
    on_intel do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.2/pmcpg-0.1.2-darwin-x64.tar.gz"
      sha256 "8610440884e46b31799c1d87fba033be6c4e10baa01db4ea8ac5f2f9329de333"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.2/pmcpg-0.1.2-linux-arm64.tar.gz"
      sha256 "32a990d009c9de3740e285966c14ea06ac19a9091dccdd0acd19b894898177d3"
    end
    on_intel do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.2/pmcpg-0.1.2-linux-x64.tar.gz"
      sha256 "f37606068b55b949051522756726041ff0826e0f2c8d2d293a476a489b728c03"
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
