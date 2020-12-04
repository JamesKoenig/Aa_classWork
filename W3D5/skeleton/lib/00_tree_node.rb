class PolyTreeNode
  attr_reader :value, :parent, :children
  def initialize(value)
    @value    = value
    @parent   = nil
    @children = []
  end

  def parent=(node)
    return false unless node.is_a?(PolyTreeNode)
    old_parent = @parent
    @parent    = node

    node.children << self unless node.children.include?(self)

    old_parent.children.delete(self) if old_parent && old_parent != node
    return true
  end

end
