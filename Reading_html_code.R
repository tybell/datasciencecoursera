
url_link <- 'http://biostat.jhsph.edu/~jleek/contact.html'

html_code <- readLines(url(url_link))

for (i in c(10,20,30,100))
{print(nchar(html_code[i]))}