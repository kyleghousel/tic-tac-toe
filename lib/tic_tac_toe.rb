require 'pry'

class TicTacToe
  attr_accessor :board

  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # Left column
    [1, 4, 7], # Middle column
    [2, 5, 8], # Right column
    [0, 4, 8], # First diagonal
    [2, 4, 6] # Second diagnoal
  ]

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts '-----------'
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts '-----------'
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(input)
    raise ArgumentError if input.nil?
    raise MoveError unless valid_move?(input)

    input.to_i - 1
  end

  def valid_move?(input)
    input.to_i.to_s == input && (1..9).include?(input.to_i)
  end

  def move(move_location, player_token = 'X')
    board[move_location] = player_token
  end

  def position_taken?(move_location)
    board[move_location] != ' '
  end
end

class MoveError < StandardError
  def message
    'Invalid move! Please enter a number between 1 and 9.'
  end
end
