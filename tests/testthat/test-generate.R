
test_that("Binalysis report can be generated", {
  binalysis <- new('Binalysis')
  r <- generate(binalysis)
  expect_equal(class(r),'list')
})

test_that('a report can be generated',{
  binalysis <- new('Binalysis')
  rp <- reportParameters('test',
                         'test')
  
  r <- generateReport(rp,binalysis)
  
  expect_s4_class(r,'Report')
})
