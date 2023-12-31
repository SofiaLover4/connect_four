# frozen_string_literal: true

# To be used in ConnectFour
module FindFourInARow
  def check_horizontal_streak(row, column, symbol, prev_column = nil)
    square = board[row][column]
    # Base Case
    return 0 if square != symbol

    left = column != 0 && prev_column != column - 1 ? check_horizontal_streak(row, column - 1, symbol, column) : 0
    right = column != 6 && prev_column != column + 1 ? check_horizontal_streak(row, column + 1, symbol, column) : 0

    total_streak = left + right + 1

    total_streak
  end

  def check_vertical_streak(row, column, symbol)
    square = board[row][column]
    # Base Case
    return 0 if square != symbol

    bottom = row != 5 ? check_vertical_streak(row + 1, column, symbol) : 0

    total_streak = bottom + 1
    total_streak
  end

  def check_diagonal_streak_up(row, column, symbol, prev_column = nil)
    square = board[row][column]

    return 0 if square != symbol

    diag_backward = column != 0 && row != 5 && prev_column != column - 1 ? check_diagonal_streak_up(row + 1, column - 1, symbol, column) : 0 
    diag_forward = column != 6 && row != 0 && prev_column != column + 1 ? check_diagonal_streak_up(row - 1, column + 1, symbol, column) : 0

    total_streak = diag_backward + diag_forward + 1
    total_streak
  end

  def check_diagonal_streak_down(row, column, symbol, prev_column = nil)
    square = board[row][column]

    return 0 if square != symbol

    diag_forward = column != 6 && row != 5 && prev_column != column + 1 ? check_diagonal_streak_down(row + 1, column + 1, symbol, column) : 0
    diag_backward = column != 0 && row != 0 && prev_column != column - 1 ? check_diagonal_streak_down(row - 1, column - 1 , symbol, column) : 0 

    total_streak = diag_backward + diag_forward + 1
    total_streak
  end

  def four_in_row?(row, column, symbol)
    check_vertical_streak(row, column, symbol) >= 4 || check_horizontal_streak(row, column, symbol) >= 4 || check_diagonal_streak_down(row, column, symbol) >= 4 || check_diagonal_streak_up(row, column, symbol) >= 4
  end
end