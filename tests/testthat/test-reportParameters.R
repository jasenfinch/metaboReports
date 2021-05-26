
test_that("reportParameters works", {
  rp <- reportParameters('test','test')
  
  expect_s4_class(rp,'ReportParameters')
})
