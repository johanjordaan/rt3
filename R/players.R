#' Player that always takes the first move in the list of valid moves.
#'
#' Internally this player calls \link[rt3]{getMoves} and then picks the first entry in the list of moves.
#'
#' @param \link[rt3]{gameState} The game state that the player should act on.
#' @export
#' @examples
#' gameState <- startGame()
#' move <- firstAvailableMovePlayer(gameState)
firstAvailableMovePlayer <- function(gameState) {
  return(getMoves(gameState)[1])
}

#' Player that picks a random move
#'
#' Internally this player calls \link[rt3]{getMoves} and then picks an entry in the list of moves at random.
#'
#' @param \link[rt3]{gameState} The game state that the player should act on.
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
