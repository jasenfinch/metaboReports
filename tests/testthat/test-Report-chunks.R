rp <- reportParameters('test','test')
r <- new('Report',rp)

test_that("report header rmd generated", {
  expect_s4_class(reportHeader(r),'Chunk')
})

test_that("report options rmd generated", {
  expect_s4_class(reportOptions(r),'Chunk')
})

test_that("session information rmd generated", {
  expect_s4_class(sessionInformationSection(r),'Chunk')
})

test_that("session information rmd generated when sessionInfo = FALSE", {
  rp <- reportParameters('test',
                         'test',
                         sessionInfo = FALSE)
  r <- new('Report',rp)
  expect_s4_class(sessionInformationSection(r),'Chunk')
})

test_that("report footer rmd generated", {
  expect_s4_class(reportFooter(r),'Chunk')
})
