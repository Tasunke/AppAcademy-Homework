require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  attr_reader :board
  attr_accessor :next_mover_mark, :other_player, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @other_player = true
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator) #we need to call this recursively (somehow)
    if board.over?
      return board.winner && board.winner != evaluator
    # elsif !evaluator != (this_player_mark)

    else
      children = self.children
      return children.any? {|child| child.losing_node?(evaluator) }  #will return a true or a false
    end
  end

  def winning_node?(evaluator)
    if board.over?
      if board.winner == evaluator
        return true
      else
        #nil or opponenet
        return false
      end
    end
  end


  def inspect
    @board.inspect
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    # temp_dup[[i, j]] = @next_mover_mark  # mark the board
    if @next_mover_mark == :x
      @next_mover_mark = :o
      bob = :x
    else
      @next_mover_mark = :x
      bob = :o
    end
    temp_dup = self.board.dup
    next_moves = []
    temp_dup.rows.each_with_index do |row, i|
      row.each_with_index do |col, j|
        # debugger
        if temp_dup.empty?([i, j])
            # next moes << tttn.new([board with mark placed on i,j], themark, prev_movepos)
            # next_moves << [i, j] 
                       
            temp_dup[[i, j]] = @next_mover_mark  # mark the board
            
            
            next_moves << TicTacToeNode.new(temp_dup, @next_mover_mark, [i,j] )
            
            #temp_dup[[i, j]] = @next_mover_mark  # mark the board
          
        end
        nil
      end
    end
    next_moves
    #returns nodes from all game states ???
  end
end

# t = TicTacToeNode.new(Board.new, :x)
# p t.children

######

# human: x
# computer: o

# current board (human just played)
#   _ x _ (0, 1)
#   _ _ _ 
#   _ o _ 


# children
#   o x _     o x _      _ _ o    
#   _ x _     _ x _      _ x _  ...  
#   _ _ _     _ _ _      _ _ _ 
#   [nm = x]  [nm = x]   [nm = x]



#   if move.dfs(winning_node?) && move != losing_node?
#      << potential
#   end


# O  [0,1]
# X  [0,0]

#O 