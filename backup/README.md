# (Quick) Backup


step 0:

add .env file with

```
HUBBA_TOKEN=<your_github_token_here>
```


step 1:

run 

    $ ruby ./prepare.rb

to get via github api all repos (for geraldb and yorobot) and
save to ./repos.yml


step 2:

run

    $ ruby ./backup.rb

to back-up all github repos to /backup2013.


that's it.

