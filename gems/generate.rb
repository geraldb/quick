###
#  to run use
#     $ ruby ./generate.rb

require 'gemverse'



gems_dir     = '/sites/rubycocos/gems'
cache_dir    = "#{gems_dir}/cache"
profiles_dir = "#{gems_dir}/profiles"

cache = Gems::Cache.new( cache_dir )

owner      = 'geraldbauer'
owner_name = 'Gerald Bauer (Austria, near Vienna)'

## step 1: read all gems
gems = read_csv( "#{profiles_dir}/#{owner}/gems.csv" )

## step 2: read all versions (from cache)
versions = cache.read_versions( gems: gems )

pp versions[0,100]
puts "   #{versions.size} record(s)"

timeline = Gems::Timeline.new( versions )

timeline.save( "#{profiles_dir}/#{owner}/README.md",
                 title: "#{owner_name}'s Gem Timeline (By Month) - #{gems.size} Gems, #{versions.size} Updates" )


puts "#{gems.size} Gems, #{versions.size} Updates - #{owner_name}'s Gem Timeline (By Month)"
puts "bye"
