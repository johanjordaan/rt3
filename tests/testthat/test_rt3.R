test_that("gameState gets created correctly", {
  x <- startGame()
  expect_equal(x$isDone,FALSE)
})

