# Local-only compat shim: Ruby 3.2+ removed Object#tainted? / #untaint,
# but Jekyll 3.9 (locked by github-pages) still calls them.
# GitHub Pages runs in safe mode and ignores _plugins/, so this file
# only affects local `jekyll serve` and won't change the deployed build.

class Object
  def tainted?
    false
  end unless method_defined?(:tainted?) || respond_to?(:tainted?)

  def untaint
    self
  end unless method_defined?(:untaint) || respond_to?(:untaint)
end
