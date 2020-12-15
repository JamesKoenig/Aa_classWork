
require_relative 'p01_int_set.rb'

class HashSet < ResizingIntSet
  private
  def [](val)
    super(val.hash)
  end
end
