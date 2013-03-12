require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Pacparser < Formula
  homepage 'https://code.google.com/p/pacparser/'
  url 'https://pacparser.googlecode.com/files/pacparser-1.3.0.tar.gz'
  sha1 'e738378e2522fba83b2ca7082d222b0a479b32b0'
  head 'https://code.google.com/p/pacparser'

  depends_on 'python' if build.include? 'with-python'
  
  option 'with-python', 'Build python module'

  def install    
    system "make", "-C", "src"
    system "make", "-C", "src", "PREFIX=#{prefix}", "install"
    if build.include? 'with-python'
      system "make", "-C", "src", "pymod"
      system "make", "-C", "src", "PREFIX=#{prefix}", "install-pymod"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test pacparser`.
    system "false"
  end
end
