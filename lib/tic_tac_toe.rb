










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