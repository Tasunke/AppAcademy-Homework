require_relative "piece"

class Board

    attr_reader :grid

    def initialize
        @grid = Array.new(8) { Array.new(8, Piece.new) }

    end

    def render
        grid.each do |row|
            puts "#{row}"
        end
    end
end


