
binalysis <- new('Binalysis')

test_that("section title rmd generated", {
  expect_s4_class(sectionTitle(binalysis),'Chunk')
})

test_that('introduction rmd generated',{
  expect_s4_class(introduction(binalysis),'Chunk')
})

test_that('object load rmd generated',{
  expect_s4_class(load(binalysis),'Chunk')
})

test_that('parameters section rmd generated',{
  expect_s4_class(parameters(binalysis),'Chunk')
})

test_that('feature overview table rmd generated',{
  expect_s4_class(featureTable(binalysis),'Chunk')
})

test_that('chromatograms rmd generated',{
  expect_s4_class(chromatograms(binalysis),'Chunk')
})

test_that('fingerprints rmd generated',{
  expect_s4_class(fingerprints(binalysis),'Chunk')
})

test_that('purity and centrality rmd generated',{
  expect_s4_class(purityAndCentrality(binalysis),'Chunk')
})

test_that('TIC plot rmd generated',{
  expect_s4_class(ticPlot(binalysis),'Chunk')
})

test_that('RSD plot rmd generated',{
  expect_s4_class(rsdPlot(binalysis),'Chunk')
})
