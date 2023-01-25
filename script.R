library(rvest)
library(dplyr)

URL <- "https://english.onlinekhabar.com/"
html_content <- read_html(URL)


titles <- html_nodes(html_content, "h2") %>%
  html_text()
titles <- gsub("\n", "", titles)

vect <- stringr::str_length(titles)

# Need to remove the titles that are very sort . This has been extracted because
# They are tag H2 class in HTML but are not tilte


titles1 <- titles[stringr::str_length(titles)>15]
titles1 <- titles1[!duplicated(titles1)]

write.csv(titles1,file="read.csv")

