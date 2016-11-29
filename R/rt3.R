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

# TODO : Split constants out
startGame <- function() {
  gameState = list(
    board = rep("_",9),
    currentPlayer = sample(c("X","O"),1),
    moves = rep(0,9),
    movesP = rep("_",9),
    numMoves = 0,
    isDone = FALSE,
    winner = "_"
  )
  return(gameState)
}

getMoves <- function(gameState) {
  return(which(gameState$board == "_"));
}

getWinner <- function(gameState) {

  winner <- function(b,s) {
    if(sum(b[s] == "X") == 3) return("X")
    if(sum(b[s] == "O") == 3) return("O");
    return("_")
  }

  rcd <- list(
    c(1,2,3), c(1,4,7), c(1,5,9),
    c(4,5,6), c(2,5,8), c(3,5,7),
    c(7,8,9), c(3,6,9)
  )

  for(t in rcd) {
    w <- winner(gameState$board,t)
    if(w != "_") return(w)
  }
  return("_");
}

makeMove <- function(gameState,move) {
  # Validate the move
  #
  if(gameState$isDone)
    stop("game done")

  if(move < 1 || move > 9 )
    stop("illegal move")

  if(gameState$board[move] != "_")
    stop("illegal move")




  # Applythe move
  #
  gameState$board[move] <- gameState$currentPlayer

  # Record the move sequence and player sequence
  #
  gameState$moves[gameState$numMoves+1] = move
  gameState$movesP[gameState$numMoves+1] = gameState$currentPlayer

  # Winner loser and end of game
  #
  gameState$winner = getWinner(gameState)
  gameState$isDone = gameState$winner != "_" || gameState$numMoves == 9


  # Next player and move
  #
  gameState$currentPlayer = ifelse(gameState$currentPlayer=="X","O","X")
  gameState$numMoves = gameState$numMoves + 1

  return(gameState)
}








