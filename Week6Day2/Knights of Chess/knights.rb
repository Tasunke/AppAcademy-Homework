require_relative "./00_tree_node"

class KnightPathFinder
    

    attr_reader :grid, :start_pos
    attr_accessor :root, :visited_pos
    
    def initialize(start_pos)
        @grid = Array.new(8) { Array.new(8, nil) }
        @start_pos = start_pos
        @visited_pos = []
        @root = PolyTreeNode.new(self.start_pos)
        #@tree =
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


        until new_que.empty?
            current_node = new_que.shift
        

            real_moves = find_real_moves(current_node.value)
            real_moves.each do |move|
                 if is_valid_pos?(move)
                    new_node = PolyTreeNode.new(move)
                    current_node.add_child(new_node)
                    new_que << new_node

                 end
            end

        end
        nil


    end

    def find_path(end_pos)
        self.build_tree(end_pos)
        tree = self.root
        engine = []
        engine << tree.dfs(end_pos)
        while engine[-1].parent
            engine << engine[-1].parent
        end
        return engine.reverse
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
p kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
p kpf.find_path([4, 2]) # => [[0, 0], [2, 1]]
p kpf.find_path([7, 3]) 
p kpf.find_path([7, 6]) 


