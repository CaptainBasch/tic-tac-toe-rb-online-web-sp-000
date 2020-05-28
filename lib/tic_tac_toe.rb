# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end



def input_to_index(user_input)
  user_input.to_i - 1
end




def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end




def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end




# Define your play method below
def play(board)
  i = 1
  while i <=9
    turn(board)
    i += 1
  end
end




def turn_count(board)
  
  count = 0
  
  board.each do |space|
    
    if space == "X" || space == "O"
      count += 1
    end
    
  end
  
  count
  
end



def current_player(board)
  
  if turn_count(board)%2 == 0
    return "X"
  else
    return "O"
  end
  
end




# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      true
    elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      true
    end

  end
end

def full?(board)
  i = 0
  
  while position_taken?(board, i) != false
    i += 1
  end
  
  if i == board.length()
    return true
  else
    return false
  end
end

def draw?(board)
  
  if full?(board) && !won?(board)
    true
  else
    false
  end
  
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    true
  end
end

def winner(board)
  
  winner_board = board.select{|move| move == "X"}
  
  if won?(winner_board)
    "X"
  elsif !won?(board)
    nil
  else
    "O"
  end
end