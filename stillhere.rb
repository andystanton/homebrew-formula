# Stillhere is a formula.
class Stillhere < Formula
  desc 'Still Here!'
  homepage 'https://github.com/andystanton'
  head 'https://github.com/andystanton/homebrew-formula.git'

  def install
    mkdir 'build' do
      puts pwd
      fail 'oh no!'
    end
  end
end
