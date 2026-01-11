# Git Notes


## Install on Ubuntu

Note, the package is *not* `git` (already taken by other project). The package is `git-core`.

    sudo apt-get git-core


## Colors

To turn on color use:

    git config --global color.ui true


## GitHub

### Use single gh-pages branch, delete master


Step 1a) Already has gh-pages branch:

    git checkout gh-pages   
    git merge master
    git push


Step 1b) Create gh-pages branch:

    git checkout -b gh-pages
    git merge master
    git push origin gh-pages


Step 2) Make gh-pages branch default branch on github via settings tab

Step 3)  Delete master branch on github

    git push origin :master     # will delete master branch on remote (that is, github)
    
    git branch -d master        # will delete master branch in local remote

Step 4) Delete local git repo and get a fresh clone from github

    rm -rf <repo>
    git clone <repo-remote-url>

That's it.


Sources:

- [GitHub Pages Workflow](http://oli.jp/2011/github-pages-workflow/)

Appendix: Check if remote is setup with git remote show <repo-remote-shorthand>. Example:

    $git remote show origin
    * remote origin
      Fetch URL: https://github.com/geraldb/football.js.git
      Push  URL: https://github.com/geraldb/football.js.git
      HEAD branch: gh-pages
      Remote branch:
        gh-pages tracked
      Local branch configured for 'git pull':
        gh-pages merges with remote gh-pages
      Local ref configured for 'git push':
        gh-pages pushes to gh-pages (up to date)


