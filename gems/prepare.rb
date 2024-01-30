###
#  to run use
#     $ ruby ./prepare.rb

require 'gemverse'



gems_dir     = '/sites/rubycocos/gems'
cache_dir    = "#{gems_dir}/cache"
profiles_dir = "#{gems_dir}/profiles"


owner = 'geraldbauer'

gems = Gems.find_by( owner: owner )
puts "  #{gems.size} record(s)"
#=> 264 record(s) founds

gems.export( "#{profiles_dir}/#{owner}/gems.csv" )


cache = Gems::Cache.new( cache_dir )

# gems = read_csv( "#{profiles_dir}/#{owner}/gems.csv" )
# puts "  #{gems.size} record(s)"


cache.update_versions( gems: gems )


# versions = cache.read_versions( gems: gems )
# puts "  #{versions.size} record(s)"



puts "bye"
