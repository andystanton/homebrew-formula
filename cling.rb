class Cling < Formula
  desc "C++ Repl"
  homepage "https://cdn.rawgit.com/root-mirror/cling/master/www/index.html"
  version "v0.3"

  stable do
    url "http://root.cern.ch/git/llvm.git", :using => :git, :tag => "cling-patches-r274612"

    resource "cling" do
      url "http://root.cern.ch/git/cling.git", :using => :git, :tag => version
    end

    resource "clang" do
      url "http://root.cern.ch/git/clang.git", :using => :git, :tag => "cling-patches-r274612"
    end
  end

  head do
    url "http://root.cern.ch/git/llvm.git", :using => :git, :branch => "cling-patches"

    resource "cling" do
      url "http://root.cern.ch/git/cling.git", :using => :git
    end

    resource "clang" do
      url "http://root.cern.ch/git/clang.git", :using => :git, :branch => "cling-patches"
    end
  end

  depends_on "cmake" => :build

  def install
    resource("cling").stage buildpath/"tools/cling"
    resource("clang").stage buildpath/"tools/clang"

    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make"
      system "make", "install"
    end

    bin.children.each do |p|
      mv p, libexec
    end
    bin.install_symlink "#{libexec}/cling" => "cling"
  end

  test do
    echo "done"
  end
end
