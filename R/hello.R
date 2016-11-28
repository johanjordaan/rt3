# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

hello <- function() {
  print("Hello, world!")
}

startGame <- function() {
  gameState = list(
    board = rep("_",9),
    currentPlayer = sample(c("X","O"),1),
    moves = rep(0,9),
    isDone = FALSE,
    winner = "",
    isDraw = FALSE
  )
  return(gameState)
}

getMoves <- function(gameState) {
  return(which(gameState$board == "_"));
}

makeMove <- function(gameState,move) {
  # TODO : Validate move
  # TODO : Make this non mutable
  # TODO : Switch User
  # TODO : Check for win or draw + set finish
  gameState$board[move] <- gameState$currentPlayer
  return(gameState)
}








