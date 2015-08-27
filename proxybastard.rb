class Proxybastard < Formula
  desc "A command line interface for enabling and disabling proxy settings in the shell and other applications"
  homepage "https://github.com/andystanton/proxybastard"
  url "https://github.com/andystanton/proxybastard.git"
  version "master"
  head "https://github.com/andystanton/proxybastard.git"

  depends_on "go" => :build
  depends_on :hg => :build

  def install
    ENV["GOPATH"] = buildpath

    # Install Go dependencies
    system "go", "get", "code.google.com/p/go-uuid/uuid"
    system "go", "get", "github.com/clbanning/mxj"
    system "go", "get", "github.com/deckarep/golang-set"
    system "go", "get", "github.com/fatih/structs"
    system "go", "get", "golang.org/x/crypto/ssh"
    system "go", "get", "github.com/andystanton/proxybastard/proxy"
    system "go", "get", "github.com/andystanton/proxybastard/util"
    # Build and install proxybastard
    system "go", "build", "-o", "proxybastard"
    build_version = "dev"
    bin.install "proxybastard"
  end

  test do
    system "#{bin}/proxybastard", "version"
  end
end
