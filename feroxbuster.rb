# frozen_string_literal: true

class Feroxbuster < Formula
  desc 'Fast, simple, recursive content discovery tool written in Rust. 🦀'
  homepage 'https://github.com/epi052/feroxbuster'
  url 'https://github.com/epi052/feroxbuster/releases/download/v2.0.1/x86_64-linux-feroxbuster.tar.gz'
  sha256 'f42e5308f5e62879ba1b540d9e46375bc88c932cffd188aafe3276c8a2c014f4'

  resource 'ferox-config' do
    url 'https://raw.githubusercontent.com/epi052/feroxbuster/master/ferox-config.toml.example'
    sha256 '39b3f5f88be7f6c906bd24e4384f9476bf67ea27dd7fb0e00f00ec8d88c2b531'
  end

  def install
    config = "#{bin}/ferox-config.toml"
    example = "#{bin}/ferox-config.toml.example"

    bin.install 'feroxbuster'

    resource('ferox-config').stage {
      bin.install resource('ferox-config')
      system 'cp', '-n', example, config
    }
  end

  test do
    assert true
  end
end
