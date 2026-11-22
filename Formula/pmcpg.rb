class Pmcpg < Formula
  desc "Private MCP Gateway: local-first gateway between AI clients and MCP servers"
  homepage "https://github.com/baobab-tech/pMCPg"
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.5/pmcpg-0.1.5-darwin-arm64.tar.gz"
      sha256 "0869381fce01f05755f62491596562b846bdf71294c0f4ca7d806fcef79523b8"
    end
    on_intel do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.5/pmcpg-0.1.5-darwin-x64.tar.gz"
      sha256 "6e14fe64468bdbb3f3a743f2ee8e78494b23b1db44d0585eaf007fcc1d3be937"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.5/pmcpg-0.1.5-linux-arm64.tar.gz"
      sha256 "8cb6df614ba674fd9a67b67ab02799eb4ede567d840592818b180520aa037590"
    end
    on_intel do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.5/pmcpg-0.1.5-linux-x64.tar.gz"
      sha256 "776c9f9d7d369f45aa6a832e114c24c4d33d68c16e55595cfdf98d36875fa3e7"
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
