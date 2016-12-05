#' rt3: A package for playing Tic-Tac-Toe in R.
#'
#' The rt3 package provides functions to allow a user to simulate Tic-Tac-Toe
#' games. It provides a convinient gameState object as well as simple interface
#' for developing new types of players.
#'
#' @references \url{https://en.wikipedia.org/wiki/Tic-tac-toe}
#'
#' @section Main Function:
#' \link[rt3]{playGame} Play a game of Tic-Tac-Toe
#'
#' @section Structures:
#' \link[rt3]{gameState} A Tic-Tac-Toe game state
#'
#' @section Constants:
#' \link[rt3]{X} The X player
#'
#' \link[rt3]{O} The O player
#'
#' \link[rt3]{EMPTY} The EMPTY constant
#'
#' \link[rt3]{NONE} The NONE constant
#'
#' @section Support Functions:
#' \link[rt3]{startGame} Create a new Tic-Tac-Toe game state
#'
#' \link[rt3]{getMoves} Get the current set of valid moves for a given game state
#'
#' \link[rt3]{makeMove} Apply a move to the given game state and return the resulting game state
#'
#' @section Built-In Player Functions:
#' \link[rt3]{randomMovePlayer} A player that plays random valid moves
#'
#' \link[rt3]{firstAvailableMovePlayer} A player that always plays the first move available
#'
#' @docType package
#' @name rt3
NULL
