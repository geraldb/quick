# Sinatra Notes

## Sinatra Notes 'n' Links

### Using Bundler with Sinatra

Official [Using Bundler with Sinatra](http://gembundler.com/sinatra.html) Article

### Using Heroku with Sinatra

Official [Deploying Rack-based Apps](https://devcenter.heroku.com/articles/rack) Article

### Sinatra Samples

[sinatra-template](https://github.com/raecoo/sinatra-template) - template for sinatra projects with Bundler, ActiveRecord, Rspec 2, Rake and multiple apps.

### Using the Console with Sinatra

Use

~~~
irb -r <your sinatra script here> e.g.
irb -r ./application.rb
irb -r ./boot.rb
~~~

### Using ActiveRecord with Rake 'n' Sinatra


Require your Sinatra app in Rake to setup the environment e.g.

~~~
task :environment do
  require "./application.rb"
end
~~~

### Using JSON/P with Sinatra

In your Sinatra app:

~~~
get '/' do
  callback = params.delete('callback') # jsonp
  json = {'your' => 'data'}.to_json

  if callback
    content_type :js
    response = "#{callback}(#{json})" 
  else
    content_type :json
    response = json
  end
  response
end
~~~

Source: [How to create a JSONP cross-domain webservice with Sinatra and Ruby](http://snippets.aktagon.com/snippets/445-How-to-create-a-JSONP-cross-domain-webservice-with-Sinatra-and-Ruby) 

Or use the Rack JSONP Middleware. Example:

~~~
require 'sinatra'
require 'json'
require 'rack/contrib/jsonp'

use Rack::JSONP

before do
  content_type :json
end
 
get '/posts' do
  Posts.find.to_a.to_json
end
~~~

Source: [Cross-Domain with Sinatra / Rack and JSONP](http://wanderwort.de/2010/03/25/sinatra-rack-with-jsonp/)



## ActiveRecord Connection Management

Tip: Make sure you close db connection after ever request.
Example:

~~~
require './boot'

# make sure connections get closed after every request e.g.
#
#  after do
#   ActiveRecord::Base.connection.close
#  end
#

use ActiveRecord::ConnectionAdapters::ConnectionManagement

run SportDb::Service::Server
~~~

## Boot Example w/ ActiveRecord (SQLite or PostgreSQL) for Heroku

~~~
ENV['RACK_ENV'] ||= 'development'

require 'bundler'

# ruby stdlibs
require 'json'
require 'uri'
require 'logger'
require 'pp'


puts "ENV['RACK_ENV'] = #{ENV['RACK_ENV']}"

Bundler.setup
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

# Database Setup & Config

db = URI.parse(ENV['DATABASE_URL'] || 'sqlite3:///sport.db')

db_config = {}

if db.scheme == 'postgres'
  db_config = {
    adapter:  'postgresql',
    host:     db.host,
    port:     db.port,
    username: db.user,
    password: db.password,
    database: db.path[1..-1],
    encoding: 'utf8'
  }
else 
  db_config = {
    adapter:  db.scheme,       # sqlite3
    database: db.path[1..-1]   # sport.db (NB: cut off leading /, thus 1..-1)
  }
end

pp db_config
ActiveRecord::Base.establish_connection( db_config )

## for debugging - disable for production use
ActiveRecord::Base.logger = Logger.new( STDOUT )


### load app/service

## add lib to load path

## $LOAD_PATH << "#{File.expand_path(File.dirname(__FILE__))}/lib"
$LOAD_PATH << "./lib"

require './lib/sportdb/service.rb'
~~~

