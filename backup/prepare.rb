require 'cocos'
load_env



require 'hubba'


# h = Hubba.reposet( 'geraldb', 'yorobot', orgs: false )
h = Hubba.reposet( 'geraldb', 'yorobot' )
pp h

write_text( './repos.yml', h.to_yaml )

puts "bye"

