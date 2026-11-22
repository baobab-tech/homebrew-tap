class Pmcpg < Formula
  desc "Private MCP Gateway: local-first gateway between AI clients and MCP servers"
  homepage "https://github.com/baobab-tech/pMCPg"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.4/pmcpg-0.1.4-darwin-arm64.tar.gz"
      sha256 "d833e70c273eaf8665ca6cb586dd94c5f6a8a6a6b2b158dd2de9ea239e98db7a"
    end
    on_intel do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.4/pmcpg-0.1.4-darwin-x64.tar.gz"
      sha256 "a33efa7d451617896ccaed868d9166fd54e8193c342cf7e129633bb9055ad961"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.4/pmcpg-0.1.4-linux-arm64.tar.gz"
      sha256 "d9dc687ce330f6ceb9263188bb095fdfe0aef81cf6461525302e3d4a9c358d9a"
    end
    on_intel do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.4/pmcpg-0.1.4-linux-x64.tar.gz"
      sha256 "0019bdb760ddf6fe8b5f85d0be9f6ea6a0d4c48201aa3bdd7021e0f7b297b6ef"
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
