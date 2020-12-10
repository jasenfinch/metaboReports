
test_that('a chunk can be generated',{
  x <- chunk(1+1,
             id = 'test',
             chunk_options = list(eval = FALSE),
             text_above = 'Some test text',
             text_below = 'Some more test text')
  
  expect_s4_class(x,'Chunk')
  expect_output(print(x),'Some test text')
})

test_that('empty chunk correctly displayed',{
  x <- chunk()
  
  expect_invisible(print(x))
})

test_that('we can get and set Chunk code',{
  x <- chunk()
  code(x) <- expr(1 + 1)
  expect_identical(code(x),expr(1 + 1))
})

test_that('we can get and set Chunk id',{
  x <- chunk()
  id(x) <- 'test'
  expect_identical(id(x),'test')
})

test_that('we can get and set Chunk knitr options',{
  x <- chunk()
  chunkOptions(x) <- list(eval = FALSE)
  expect_identical(chunkOptions(x),list(eval = FALSE))
})

test_that('we can get and set Chunk text above',{
  x <- chunk()
  textAbove(x) <- 'Some test text'
  expect_identical(textAbove(x),'Some test text')
})

test_that('we can get and set Chunk text below',{
  x <- chunk()
  textBelow(x) <- 'Some test text'
  expect_identical(textBelow(x),'Some test text')
})
