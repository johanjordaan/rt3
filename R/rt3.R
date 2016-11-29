#' This is a R Tic-Tac-Toe library
#'
#'

#' Start a new game
#'
#' @export
#' @examples
#' gameState <- startGame()

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

#' Get the current valid moves
#'
#' @param gameState This is a gamestate greated by startGame
#' @export
#' @examples
#' moves <- getMoves(gameState)
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
  if(gameState$isDone)
    stop("game done")

  if(move < 1 || move > 9 )
    stop("illegal move")

  if(gameState$board[move] != "_")
    stop("illegal move")

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
  gameState$isDone = gameState$winner != "_" || gameState$numMoves == 9

  # Next player and move
  #
  gameState$currentPlayer = ifelse(gameState$currentPlayer=="X","O","X")
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
  players = list("X"=px,"O"=po)

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
  return(sample(getMoves(gameState),1))
}
