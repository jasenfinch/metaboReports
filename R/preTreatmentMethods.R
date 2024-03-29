#' @importFrom metabolyseR sinfo
#' @importFrom glue glue
#' @importFrom stringr str_detect
#' @importFrom tibble deframe tibble
#' @importFrom dplyr select group_by summarise filter n

preTreatmentMethods <- function(analysis, type = 'head', cls = 'class', chunks = c('rsd','lda','supervisedRF')){
  headHash <- hash(type)
  
  ellipses <- addEllipses(analysis,cls)
  
  if ({analysis %>% sinfo(type = 'pre-treated') %>% nrow()} > 0) {
    glue("
    
{headHash} Pre-treatment
{ifelse('rsd' %in% chunks,RSDplot(analysis,cls),'')}
```{{r unsupervisedPlots,echo = F,fig.width = 10}}
metabolyseR::plotPCA(analysis,type = 'pre-treated',cls = '{cls}',ellipses = {ellipses}) + plotUnsupervisedRF(analysis,type = 'pre-treated',cls = '{cls}',ellipses = {ellipses},title = 'Multidimensional scaling (MDS) -\nunsupervised Random Forest')
```
{ifelse('lda' %in% chunks,LDAplot(analysis,cls),'')}
{ifelse('supervisedRF' %in% chunks,supervisedRFplots(analysis,cls),'')}
")
  } else {
    ""
  }
}

getClasses <- function(analysis,cls = 'class'){
  analysis %>% 
    sinfo(type = 'pre-treated') %>% 
    select(cls) %>%
    deframe()
}

nClasses <- function(classes){
  classes %>%
    unique() %>%
    length()
}

addEllipses <- function(analysis,cls = 'class'){
  if (getClasses(analysis,cls) %>% nClasses() > 10) {{
    ellipses <- FALSE
  }} else {{
    ellipses <- TRUE
  }}
  return(ellipses)
}

classFreq <- function(analysis,cls = 'class'){
  getClasses(analysis,cls) %>%
    {tibble(Class = .)} %>%
    group_by(Class) %>%
    summarise(Freq = n())
}

ROCplot <- function(analysis,cls = 'class'){
  classes <- getClasses(analysis,cls)
  if (is.numeric(classes)){
    FALSE
  } else {
    TRUE
  }
}

RSDplot <- function(analysis,cls = 'class'){
  if (T %in% str_detect(analysis@parameters@preTreat %>% names(),'QC')) {
    glue("
    
```{{r RSDplot,echo = F}}
plotRSD(analysis,cls = '{cls}')
```
    ")
  } else {
    ""
  }
}

LDAplot <- function(analysis,cls = 'class'){
  ellipses <- addEllipses(analysis,cls)
  classes <- getClasses(analysis,cls)
  nCls <- nClasses(classes)
  clsFreq <- classFreq(analysis,cls)
  if (nCls > 1) {
    if (!(1 %in% clsFreq$Freq)) {
      glue("
      
```{{r LDAplot,echo = F,fig.width = 10}}
plotLDA(analysis,type = 'pre-treated',cls = '{cls}',ellipses = {ellipses})
```
  ")
    } else {
      ''
    }
  }
}

supervisedRFplots <- function(analysis,cls = 'class'){
  ellipses <- addEllipses(analysis,cls)
  classes <- getClasses(analysis,cls)
  clsFreq <- classFreq(analysis,cls)
  nCls <- nClasses(classes)
  if (nCls > 1) {
    if (nrow(clsFreq %>%
             filter(Freq > 5)) > 1) {
      glue("
    
```{{r supervisedRFplots,echo = F,fig.width = 10}}
  plotSupervisedRF(analysis,type = 'pre-treated',cls = '{cls}',label = NULL,ellipses = {ellipses},title = 'Multidimensional scaling (MDS) -\nsupervised Random Forest',ROC = {ROCplot(analysis,cls)})
```
       ")
    } else {
      ""
    }
  } else {
    ""
  }
}