#' Start a new game
#'
#' @description This function starts a new game. It randomly assigns a
#'  starting player and returns a new game state object.
#'
#' @return gameState A new \link[rt3]{gameState}.
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

#' The game state is represented by a list of 8 values.
#'
#' \describe{
#'   \item{board}{The boards state represented by a list. It contains a list of \link[rt3]{X}'s, \link[rt3]{O}'s and \link[rt3]{EMPTY}'s. It's initially filled by \link[rt3]{EMPTY}'s.}
#'   \item{currentPlayer}{The player who needs to make the next move. This either \link[rt3]{X} or \link[rt3]{O}.}
#'   \item{startingPlayer}{the player who was the first player to move in this game state. This either \link[rt3]{X} or \link[rt3]{O}.}
#'   \item{moves}{The list of moves made by players to get to this game state. This initially filled with 0's. }
#'   \item{movesP}{The player turn list. It contains a list of alternating \link[rt3]{X}'s and \link[rt3]{O}'s }
#'   \item{numMoves}{Number of moves made to get to this game state.}
#'   \item{isDone}{This indicates wheter this is a final game state. It is final if either \link[rt3]{X} or \link[rt3]{O} has won if there is no winner: \link[rt3]{NONE}.  }
#'   \item{winner}{If there is a winner in this games state the value is either \link[rt3]{X} or \link[rt3]{O}. If the game state is a draw or the game is not finished the value is \link[rt3]{NONE}.  }
#' }
#'
gameState <- startGame()


#' Get the list of valid move from the game state.
#'
#' @param gameState The \link[rt3]{gameState} for which moves must be calculated.
#' @return validMoves An array (["integer"]) of valid moves based on the provided game state.
#' @export
#' @examples
#' gameState <- startGame()
#' validMoves <- getMoves(gameState)
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

#' Apply the move to the current game state an produce a new game state.
#'
#' @param gameState The \link[rt3]{gameState} to apply the move to.
#' @param move The move to be applied to the game state.
#' @return \link[rt3]{gameState} The game state after applying the move to the game state.
#' @export
#' @examples
#' gameState <- startGame()
#' gameState <- makeMove(gameState,1)
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


#' Play a game of Tic-Tac-Toe using the two provided stragies.
#'
#' @param px The X player strategy.
#' @param po The O player strategy.
#' @return gameState The final \link[rt3]{gameState} after playing a full game.
#' @export
#' @examples
#' px <- firstAvailableMovePlayer
#' py <- randomMovePlayer
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
