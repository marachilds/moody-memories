library(readtext)

happy <- readtext("happy.txt")
writeLines(gsub(" ", "%20", fixed = TRUE, happy))

mad <- readtext("mad.txt")
writeLines(gsub(" ", "%20", fixed = TRUE, mad))

sad <- readtext("sad.txt")
writeLines(gsub(" ", "%20", fixed = TRUE, sad))

scared <- readtext("scared.txt")
writeLines(gsub(" ", "%20", fixed = TRUE, scared))