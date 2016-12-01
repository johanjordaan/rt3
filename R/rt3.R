#' This is a R Tic-Tac-Toe library
#'
#' @author Johan Jordaan
#'

#' Constant for X player
#'
#' @export
X <- "X"

#' Constant for Y player
#'
#' @export
O <- "O"

#' Constant for empty square
#'
#' @export
EMPTY <- "_"

#' Constant for no winner
#'
#' @export
NONE <- "_"

#' Start a new game
#'
#' @export
#' @examples
#' gameState <- startGame()
startGame <- function() {
  startingPlayer <- sample(c(X,O),1)
  gameState = list(
    board = rep(EMPTY,9),
    currentPlayer = startingPlayer,
    startingPlayer = startingPlayer,
    moves = rep(0,9),
    movesP = rep(EMPTY,9),
    numMoves = 0,
    isDone = FALSE,
    winner = NONE
  )
  return(gameState)
}

#' Get the current valid moves
#'
#' @param gameState This is a gamestate greated by startGame
#' @export
#' @examples
#' moves <- getMoves(gameState)
getMoves <- function(gameState) {
  return(which(gameState$board == EMPTY));
}

getWinner <- function(gameState) {

  winner <- function(b,s) {
    if(sum(b[s] == X) == 3) return(X)
    if(sum(b[s] == O) == 3) return(O);
    return(NONE)
  }

  rcd <- list(
    c(1,2,3), c(1,4,7), c(1,5,9),
    c(4,5,6), c(2,5,8), c(3,5,7),
    c(7,8,9), c(3,6,9)
  )

  for(t in rcd) {
    w <- winner(gameState$board,t)
    if(w != NONE) return(w)
  }
  return(NONE);
}

#' Apply the move to the current game state an produce a new game state
#'
#' @param gameState The gamestate to apply the move to
#' @param move One of the moves returned by getMoves()
#' @export
#' @examples
#' gameState <- makeMoves(gameState,move)
makeMove <- function(gameState,move) {
  # Validate the move
  #
  if(gameState$isDone) {
    print(gameState)
    print(move)
    print(getMoves(gameState))
    stop("game done")
  }

  if(move < 1 || move > 9 ) {
    print(gameState)
    print(move)
    print(getMoves(gameState))
    stop("illegal move (out of bounds)")
  }

  if(gameState$board[move] != EMPTY) {
    print(gameState)
    print(move)
    print(getMoves(gameState))
    stop("illegal move (occupied square)")
  }

  # Apply the move
  #
  gameState$board[move] <- gameState$currentPlayer

  # Record the move sequence and player sequence
  #
  gameState$moves[gameState$numMoves+1] = move
  gameState$movesP[gameState$numMoves+1] = gameState$currentPlayer

  # Winner loser and end of game
  #
  gameState$winner = getWinner(gameState)
  gameState$isDone = gameState$winner != NONE || (gameState$numMoves+1) == 9

  # Next player and move
  #
  gameState$currentPlayer = ifelse(gameState$currentPlayer==X,O,X)
  gameState$numMoves = gameState$numMoves + 1

  return(gameState)
}


#' Play a game using the two strageries
#'
#' @param px The X player strategy
#' @param po The O player strategy
#' @export
#' @examples
#' finalGameState <- playGame(px,py)
playGame <- function(px,po) {
  players = list(X=px,O=po)

  gameState <- startGame()
  while(!gameState$isDone) {
    player <- players[[gameState$currentPlayer]]
    gameState <- makeMove(gameState,player(gameState))
  }
  return(gameState);
}

#' Player that always takes the first move in the list
#'
#' @param gameState The current gamestate
#' @export
#' @examples
#' finalGameState <- playGame(px,py)
firstAvailableMovePlayer <- function(gameState) {
  return(getMoves(gameState)[1])
}

#' Player that picks a random move
#'
#' @param gameState The current gamestate
#' @export
#' @examples
#' finalGameState <- playGame(px,py)
randomMovePlayer <- function(gameState) {
  moves <- getMoves(gameState)

  if(length(moves)==0) {
    print(gameState)
    error("no moves")
  }

  if(length(moves) == 1) return(moves[1])
  else return(sample(moves,1))
}
