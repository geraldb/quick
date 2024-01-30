require 'gitti/backup'


reposet = GitRepoSet.read( './repos.yml' )
#=>  560 repo(s) @ 72 org(s)
#=>  556 repo(s) @ 69 org(s)  - on Oct/11 2023
#=>  556 repo(s) @ 70 org(s)  - on Jan/28 2024   ~ about 2 GiG


backup = GitBackup.new( '/backup2024' )
backup.backup( reposet )

puts "bye"

