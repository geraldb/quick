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




---


## test backup with local checkoutt

_Getting a working copy of a bare repository_


```
$ git clone c:\backup2024\0xCompute\punks12px
$ git clone c:\backup2024\0xCompute\punks12px.vol2
...
```



## misc(ellaneous)

check if works if update repo gets recycled / replaced e.g. 

```
From https://github.com/0xCompute/punks12px
 + 5427ee06...ed2e18ac master     -> master  (forced update)
```
