class KnightPathFinder
    
    def initialize(start_pos)
        @grid = Array.new(8) { Array.new(8, nil) }
        @start = @grid[start_pos.first][start_pos.last]
    end

    def move_a(start)
        @grid[start.first+2][start.last+1]
    end
    def move_b(start)
        @grid[start.first-2][start.last+1]
    end
    def move_c(start)
        @grid[start.first+2][start.last-1]
    end
    def move_d(start)
        @grid[start.first-2][start.last-1]
    end

    def move_e(start)
        @grid[start.first+1][start.last+2]
    end
    def move_f(start)
        @grid[start.first-1][start.last+2]
    end
    def move_g(start)
        @grid[start.first+1][start.last-2]
    end
    def move_h(start)
        @grid[start.first-1][start.last-2]
    end

    def find_path(end_pos)
        
    end

end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
p kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]