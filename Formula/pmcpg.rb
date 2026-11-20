class Pmcpg < Formula
  desc "Private MCP Gateway: local-first gateway between AI clients and MCP servers"
  homepage "https://github.com/baobab-tech/pMCPg"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.0/pmcpg-0.1.0-darwin-arm64.tar.gz"
      sha256 "f674a6d47a522ad032c5eee11196ff46459c1e60af7229d2f58c6a32075dbd47"
    end
    on_intel do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.0/pmcpg-0.1.0-darwin-x64.tar.gz"
      sha256 "238e8a09ee637550ea624a7ee3db231d07d378c8a4437ae9a56cbd2f2e52257f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.0/pmcpg-0.1.0-linux-arm64.tar.gz"
      sha256 "6d9011f574920f08431c6f258c58ddbe00d9487d0b1d4fa005d9758a21e7cbc8"
    end
    on_intel do
      url "https://github.com/baobab-tech/pMCPg/releases/download/v0.1.0/pmcpg-0.1.0-linux-x64.tar.gz"
      sha256 "ee88008ec448d4f944992c4d65bc308ad06ead15679096d5a3f986e9c86feb1e"
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
