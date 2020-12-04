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

  def add_child(child_node)
    children << child_node
    child_node.parent = self 
  end

  def remove_child(child_node)
    raise "Any comment you want" unless children.include?(child_node)
    children.delete(child_node)
    child_node.parent = nil 

  end

  def dfs(search_value)
    return self if value==search_value
    children.each do |child|
      memo = child.dfs(search_value)
      return memo unless !memo
    end
    return nil
  end

  def bfs(search_value)
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if node.value == search_value
      queue += node.children
    end
    return nil
  end
end
