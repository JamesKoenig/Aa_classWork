class PolyTreeNode
    attr_reader :parent,:value, :children
    def initialize(str)
        @parent = nil
        @children = []
        @value = str
    end

    # reassign parent for children (children given )
    def parent=(parent1)
        if @parent == parent1
            return
        end
        if @parent != nil
            @parent.children.delete(self)
        end
        if parent1 != nil
            parent1.children << self
        end
            @parent = parent1
    end

    def add_child(child1)
        child1.parent = self
    end

    def remove_child(child1)
        raise error if child1.parent.nil?
        child1.parent = nil
    end

    def dfs(target)
        return nil if self.nil?
        return self if self.value == target
        self.children.each do |child|
            new_arr = child.dfs(target)
            if !new_arr.nil?
                return new_arr
            end
        end
        nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            child = queue.shift
            return child if child.value == target
            child.children.each do |ele|
                queue << ele
            end
        end
        nil
    end
end