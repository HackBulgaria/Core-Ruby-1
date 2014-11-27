require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Unit::TestCase
  include GameOfLife
  def test_empty_board_creation
    assert_equal [], board = GameOfLife::Board.new.to_a
  end

  def test_live_cells_indexing
    board = GameOfLife::Board.new [1, 2], [1, 3], [5, 6]
    assert board[1, 2]
    assert_equal false, board[3, 5]
  end

  def test_live_cells_iteration
    board = GameOfLife::Board.new [1, 2], [1, 3]
    alive_cells_string = ''
    board.each do |x, y|
       alive_cells_string += "The cell at (#{x}, #{y}) is alive" + "\n"
    end
    assert_equal alive_cells_string, "The cell at (1, 2) is alive\nThe cell at (1, 3) is alive\n"
  end

  def test_live_cells_counting
    board = GameOfLife::Board.new [1, 2], [1, 3], [5, 6]
    assert_equal board.count, 3
  end

  def test_evolution
    board    = GameOfLife::Board.new [1, 2], [1, 3], [1, 4]
    next_gen = board.next_generation
    assert_equal false, next_gen[1, 2]
    assert next_gen[0, 3]
    assert next_gen[2, 3]
  end
end
