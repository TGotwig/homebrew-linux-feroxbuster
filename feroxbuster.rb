# frozen_string_literal: true

class Feroxbuster < Formula
  desc 'Fast, simple, recursive content discovery tool written in Rust. 🦀'
  homepage 'https://github.com/epi052/feroxbuster'
  url 'https://github.com/epi052/feroxbuster/releases/download/v1.11.0/x86_64-linux-feroxbuster.tar.gz'
  sha256 '0dad1b0c62e70f018668be02cc3b3cad03e9bbd9f6f3cac89aebaa831b68e16b'

  resource 'ferox-config' do
    url 'https://raw.githubusercontent.com/epi052/feroxbuster/master/ferox-config.toml.example'
    sha256 'db058ef915f7847ba7404805c48e55281f2cddd6b058f8fe232fab4000afd700'
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
