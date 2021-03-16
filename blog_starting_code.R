library(tidyverse)
library(blogdown)

#new_site(theme = "wowchemy/starter-academic")


#run this after restart!
serve_site()


#new post code
blogdown::new_post(title = "Hi Hugo", 
                   ext = '.Rmarkdown', 
                   subdir = "post")


blogdown::check_gitignore()
blogdown::check_content()
blogdown::check_netlify()
blogdown::check_hugo()
