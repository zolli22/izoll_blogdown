library(tidyverse)
library(blogdown)

#new_site(theme = "wowchemy/starter-academic")


#run this after restart!
serve_site()

blogdown::stop_server()

#new post code
blogdown::new_post(title = "Makeup Shades - Tidy Tuesday, March 30", 
                   ext = '.Rmd', #or .md
                   subdir = "post")


blogdown::check_gitignore()
blogdown::check_content()
blogdown::check_hugo()
blogdown::check_netlify()
blogdown::check_site()

blogdown::build_site(build_rmd = 'newfile')

blogdown::build_site(build_rmd = 'timestamp')
