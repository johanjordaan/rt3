#' Player that always takes the first move in the list of valid moves.
#'
#' @description Internally this player calls \link[rt3]{getMoves} and then picks the first entry in the list of moves.
#'   A player is a function that takes a game state as input and returns a valid move index.
#'
#' @param gameState The \link[rt3]{gameState} that the player should act on.
#' @return moveIndex Index to a valid move as returned by the \link[rt3]{getMoves} function.
#' @export
#' @examples
#' gameState <- startGame()
#' move <- firstAvailableMovePlayer(gameState)
firstAvailableMovePlayer <- function(gameState) {
  return(getMoves(gameState)[1])
}

#' Player that picks a random move
#'
#' @description Internally this player calls \link[rt3]{getMoves} and then picks an entry
#'   in the list of moves at random.
#'
#'   A player is a function that takes a game state as input and returns a valid move index.
#'
#' @param gameState The \link[rt3]{gameState} that the player should act on.
#' @return moveIndex Index to a valid move as returned by the \link[rt3]{getMoves} function.
#' @export
#' @examples
#' gameState <- startGame()
#' move <- randomMovePlayer(gameState)
randomMovePlayer <- function(gameState) {
  moves <- getMoves(gameState)

  if(length(moves)==0) {
    print(gameState)
    stop("no moves")
  }

  if(length(moves) == 1) return(moves[1])
  else return(sample(moves,1))
}
