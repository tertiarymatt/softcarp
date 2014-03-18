getwd()
list.files()
list.dirs()

file.remove("Average X.txt")
file.rename("Session2.R", "Session02.R")

dir.create("scripts/2014_03_17")
file.copy("scripts/Session02.R", "scripts/2014_03_17/")
file.copy("scripts/Session03.R", "scripts/2014_03_17/")
file.copy("scripts/Session04.R", "scripts/2014_03_17/")
file.copy("scripts/toyline.R", "scripts/2014_03_17/")

file.remove("Session02.R")
file.remove("Session03.R")
file.remove("Session04.R")
file.remove("toyline.R")

dir.create("data")
file.copy("gapminder", "data/")
file.remove("gapminder")

file.rename("file_structures", "file_structures.txt")
file.rename("ggplot2notes", "ggplot2notes.txt")

file.copy(c("file_structures.txt", "ggplot2notes.txt"), "notes/")

file.copy(c('toylinelot.pdf', 'toylineplot.png'), 'output/')
file.remove(c('toylinelot.pdf', 'toylineplot.png', 'file_structures.txt', 'ggplot2notes.txt'))

file.copy(c('block02_careFeedingData.rmd', 'block03_basicObjects.rmd', 'block17_colorsGgplot2Qualitative.rmd', 'block18_gapminderGgplot2VsLattice.rmd', 'block90_baseLatticeGgplot2.rmd'), "sc_lectures/")
file.remove(c('block02_careFeedingData.rmd', 'block03_basicObjects.rmd', 'block17_colorsGgplot2Qualitative.rmd', 'block18_gapminderGgplot2VsLattice.rmd', 'block90_baseLatticeGgplot2.rmd'))
