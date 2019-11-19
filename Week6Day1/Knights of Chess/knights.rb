require_relative "./00_tree_node"

class KnightPathFinder
    

    attr_reader :grid, :start_pos
    attr_accessor :root, :visited_pos
    
    def initialize(start_pos)
        @grid = Array.new(8) { Array.new(8, nil) }
        @start_pos = start_pos
        @visited_pos = []
        @root = PolyTreeNode.new(self.start_pos)
        # @start = @grid[start_pos.first][start_pos.last]
    end

#           A   B    

#      C            D     
#           start
#      E            F

#          G    H


    def all_moves_from_pos(current_pos)
        x = current_pos.first
        y = current_pos.last
        moves = []
        new_move = []
        duo = true
        nega = false
        fur = false
        i = 0
        while i < 8
            if duo == true && nega == false && fur == false
                nega = true
                moves << [x + 2, y + 1]
            elsif duo == true && nega == true && fur == false
                nega = false
                fur = true
                moves << [x + 2, y - 1]
            elsif duo == true && nega == false && fur == true
                nega = true
                moves << [x - 2, y + 1]
            elsif duo == true && nega == true && fur == true
                nega = false
                duo = false
                fur = false
                moves << [x - 2, y - 1]
            elsif duo == false && nega == false && fur == false
                nega = true
                moves << [x + 1, y + 2]
            elsif duo == false && nega == true && fur == false
                nega = false
                fur = true
                moves << [x + 1, y - 2]
            elsif duo == false && nega == false && fur == true
                nega = true
                moves << [x - 1, y + 2]
            else
                moves << [x - 1, y - 2]
            end
            i += 1
        end
        moves
    end

    def build_tree(end_pos)
        new_que = []
        
        new_que << self.root
        #return moves_taken if self.start_pos == end_pos

        until new_que.empty?
            current_node = new_que.shift
        
            #return moves_taken << current_node if current_node == end_pos
            #visited_pos << current_node
            #real_moves = []
            real_moves = find_real_moves(current_node.value)
            real_moves.each do |move|
                 if is_valid_pos?(move)
                    new_node = PolyTreeNode.new(move)
                    current_node.add_child(new_node)
                    new_que << new_node
                    #moves_taken << move
                 end
            end
            #return moves_taken << current_node if current_node == end_pos
            #return visited_pos if current_node == end_pos
        end
        nil

        # real_moves.each do |ele|
        #     return moves_taken << ele if ele == end_pos
        #     find_path(ele)
        # end
    
    end

    def find_real_moves(start)
        moves = self.all_moves_from_pos(start)
        real_moves = moves.select { |el| self.is_valid_pos?(el) && !visited_pos.include?(el) }
        self.visited_pos += real_moves
        real_moves
    end

    def is_valid_pos?(pos)
        pos.first < 8 && pos.last < 8 && pos.first >= 0 && pos.last >= 0
    end

end


kpf = KnightPathFinder.new([0, 0])
p kpf.build_tree([2, 1]) # => [[0, 0], [2, 1]]
p kpf.build_tree([3, 3]) # => [[0, 0], [2, 1], [3, 3]]

#p kpf.grid[10][10]
#p kpf.all_moves_from_pos([0,0])

#p kpf.is_valid_pos?([-1,-6])

#___________________ BFS _______________________

# def bfs(value)

        
#     new_q = []

#     new_q << self

#     until new_q.empty?
#         current_node = new_q.shift
#         return current_node if current_node.value == value
#         current_node.children.each do |child|
#             new_q << child
#         end
        
#     end
#     nil

#     # if self.value == value
#     #     return self
#     # end
# end


# 0,0,  2,1,   3,4   (4,2)

#0,0  2,1  1,2 (3,0)

#Its almost like it is printing out a subset of que ... 