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
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif  position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      nil
    end
  end
  return
end

def full?(board)
  board.all? do |player_char|
    player_char == "X" || player_char == "O"
  end
end

def draw?(board)
  draw = true
  if full?(board) == true && WIN_COMBINATIONS.any?{|i| i == won?(board)}
    draw = false
  elsif full?(board) != true
    draw = false
  end
  draw
end

def over?(board)
  if full?(board) == true || WIN_COMBINATIONS.any?{|i| i == won?(board)} || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  if(draw?(board) || !full?(board)) && !won?(board)
    return nil
  elsif (board[won?(board)[0]] == "X")
    return "X"
  elsif (board[won?(board)[0]] == "O")
    return "O"
  end
end
