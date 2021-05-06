setwd("D:/Libraries/Documents/GitHub/SaySomethingIn.github.io/blogdown")

Sys.setenv(RSTUDIO_PANDOC="C:/Program Files/RStudio/bin/pandoc")

#install.packages("git2r")
library(git2r)
library(blogdown)

# Insure you have navigated to a directory with a git repo.
dir <- "git@github.com:RoyEW/blogdown.git"

# Configure git.
git2r::config(user.name = "RoyEW",user.email = "roywilson49@gmail.com")
git2r::ssh_path()
# Check git status.

git2r::status()
# Download a file.

git2r::init()



workingdir="D:/Libraries/Documents/GitHub/SaySomethingIn.github.io/blogdown"


blogdown::build_site(build_rmd = F)

filesindir <- list.files(workingdir, pattern=NULL, all.files=FALSE,
                         full.names=FALSE)

#filesindir
for (i in seq(1:length(filesindir))){
  git2r::add(path = paste(workingdir,"/", filesindir[i],sep=""))
}

cred <- git2r::cred_user_pass("RoyEW","wIbgUPE6YuKPGKhlcW")

cred <- git2r::cred_ssh_key(publickey = "C:/Users/Roy/.ssh/id_rsa.pub",
                    privatekey = "C:/Users/Roy/.ssh/id_rsa"
                    )


tryCatch({
  git2r::commit(message = "automated commit")
  
  git2r::push(credentials = cred)
},error = function(e){print(e)})
git2r::push(git2r::init(),credentials = cred)
