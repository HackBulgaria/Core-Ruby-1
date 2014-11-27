module GameOfLife
  class Board
    include Enumerable

    attr_accessor :coordinates

    def initialize(*coordinates)
      @coordinates = coordinates.to_a
    end

    def generate_neighbours(x_coord, y_coord)
      [[x_coord - 1, y_coord + 1], [x_coord, y_coord + 1], [x_coord + 1, y_coord + 1], \
       [x_coord - 1, y_coord], [x_coord + 1, y_coord], [x_coord - 1, y_coord - 1], \
       [x_coord, y_coord - 1], [x_coord + 1, y_coord - 1]]

    end

    def adjacent_cells_count(x_coord, y_coord)
      adjacency_counter = 0
      generate_neighbours(x_coord, y_coord).each do |cell|
        adjacency_counter += 1 if @coordinates.include? cell
        end
      adjacency_counter
    end

    def [](x_coord, y_coord)
      @coordinates.include? [x_coord, y_coord]
    end

    def each(&block)
      @coordinates.each &block
    end

    def count
      @coordinates.size
    end

    def cell_will_live_check(x_coord, y_coord)
      if self[x_coord, y_coord]
        adjacent_cells_count(x_coord, y_coord).between?(2, 3)
      else
        adjacent_cells_count(x_coord, y_coord) == 3
      end
    end

    def generate_dead_cells_neighbours(dead_cells_coordinates)
      new_coordinates = []
      dead_cells_coordinates.each do |dead_cell|
        new_coordinates << dead_cell if cell_will_live_check(dead_cell[0], dead_cell[1])
      end
      new_coordinates
   end

    def next_generation
      new_coordinates = []
      @coordinates.each do |cell|
        new_coordinates << cell if cell_will_live_check(cell[0], cell[1])
        generate_dead_cells_neighbours(generate_neighbours(cell[0], cell[1])).each do |coordinates|
          new_coordinates << coordinates unless new_coordinates.include? coordinates
        end
      end
      Board.new *new_coordinates
    end

    def print_me(generation, endless = false)
     result = ' ' * 25
      loop do
        0.upto(16) do |first_index|
          0.upto(16) do |second_index|
            generation.include?([first_index, second_index]) ? result += '*' : result += ' '
            result += "\n" + ( ' ' * 25) if (first_index * second_index) % 289 == 0
            end
          end
        puts result, "\n", "-" * 100
        generation = Board.new(*generation.coordinates).next_generation if endless
        result = ' ' * 25 if endless
        break unless endless
      end
    end
  end
end

=begin
board    = GameOfLife::Board.new [0, 7], [1, 5], [1, 6], [1, 7], [1, 8], [2, 4], [2, 10], [3, 1], [3, 4], [3, 6], [3, 8], [3, 9], [3, 11], [4, 0], [4, 2], [4, 4], [4, 6], [4, 11], [4, 15], [5, 1], [5, 4], [5, 9], [5, 11], [5, 13], [5, 15], [6, 5], [6, 7], [6, 8], [6, 10], [6, 12], [6, 13], [7, 7], [7, 13], [8, 7], [8, 8], [8, 9], [8, 10], [8, 11], [9, 9]
GameOfLife::Board.new.print_me(board = board.next_generation)
=end

