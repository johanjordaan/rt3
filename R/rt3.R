#' rt3: A package to facilitate playing Tic-Tac-Toe or Naughts and Crosses.
#'
#' The rt3 package impliments functions to allow a user to simulate Tic-Tac-Toe
#' games. It provides a convinient gameState objescta as well as simple interface
#' for developing new types of players.
#'
#'@references \url{https://en.wikipedia.org/wiki/Tic-tac-toe}
#'
#' @section rt3 functions:
#' \link[rt3]{playGame} Play a game of Tic-Tac-Toe
#'
#' \link[rt3]{startGame} Start a game of Tic-Tac-Toe
#'
#' \link[rt3]{getMoves} Get the current set of valid moves for a given game state
#'
#' \link[rt3]{makeMove} Apply a move to the given game state
#'
#' \link[rt3]{getWinner} Get the winner in a given game state
#'
#' \link[rt3]{randomMovePlayer} A player that plays random valid moves
#'
#' \link[rt3]{firstAvailableMovePlayer} A player that alwasy plays the first move available
#'
#' @docType package
#' @name rt3
NULL
