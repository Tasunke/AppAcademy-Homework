require_relative "stack"
require_relative "queue"
require "byebug"

class PolyTreeNode
    attr_reader :parent, :value
    attr_accessor :children


    def initialize(value)
    @parent = nil
    @children = []
    @value = value
    end

    def parent=(parent_node)
        if self.parent
            #self.parent.remove_child(self)
            self.parent.children.delete(self)
        end
        @parent = parent_node #??
        if parent_node
            unless parent_node.children.include?(self)
                parent_node.children << self
            end
        end
        if parent_node.nil?
            return nil
        end
        #parent_node.add_child(self) unless parent_node.children.include?(self)
    end

    def add_child(child_node)
        unless self.children.include?(child_node)
            @children << child_node
            child_node.parent=(self)
        end
    end

    def remove_child(child_node)
        raise "Node is an Orphan" unless child_node.parent
        #child_node.parent=(nil)
        #debugger
        new_kids = []
        #debugger
        @children.each_with_index do |child, i|
            #debugger
            unless child == child_node
                # self.children.delete_at(i)
                # puts 'hi'
                new_kids << child
            end
        end
        self.children = new_kids
        
        unless child_node.parent.nil?
            child_node.parent = nil
        end
    end

    def inspect
        @value.inspect
    end

    def dfs(value)
        return self if self.value == value

        children.each do |child|
            bob = child.dfs(value)
            return bob if bob
        end
        nil
    end

    def bfs(value)

        
        new_q = []

        new_q << self

        until new_q.empty?
            current_node = new_q.shift
            return current_node if current_node.value == value
            current_node.children.each do |child|
                new_q << child
            end
            
        end
        nil

        # if self.value == value
        #     return self
        # end
    end

end

# Nu_Q = Queue.new
# p Nu_Q

# a = [1,2,3,4,5]
# p a.delete_at(3)
# p a




# new_stack = Stack.new

# if self.value == value
#     return self
# elsif self.children
#     if self.childreen.length == 2
#         new_stack.push(self.children.last)
#         new_stack.push(self.children.first)
#     else
#         self.children.each do |child|
#         new_stack.push(child)
#     end
# end
#     # new_stack.push(self.children.last)
#     # new_stack.push(self.children.first)
# else
#     new_stack.pop
# end

# return nil if new_stack.empty?

# new_var = new_stack.pop
# new_var.dfs(value)
