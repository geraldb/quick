# Ubuntu Notes

Ruby

## Install on Ubuntu

### Build Essential

    sudo apt-get install build-essential

### Essential Ruby Packages

    sudo apt-get install ruby irb ri rdoc
    
Includes the following dependencies:

    irb1.8 libreadline-ruby1.8 libreadline5 libruby1.8 rdoc1.8 ri1.8 ruby1.8

Possible missing (add):

    ruby1.8-dev libopenssl-ruby


### Get RubyGems from Source

TBD

Add to `~/.bashrc`:

    export PATH=/var/lib/gems/1.8/bin:$PATH


### Nokogiri

Use:

    sudo apt-get install libxml2 libxml2-dev libxslt1-dev
    sudo gem install nokogiri

### SQLite3 Support

Use:

    sudo apt-get install sqlite3 libsqlite3-dev
    sudo gem install sqlite3-ruby
    
### MySQL Support

Use:

    sudo apt-get install mysql-server libmysqlclient15-dev
    sudo gem install mysql


## `hirb` and `wirble` - Colors for `irb` - Formatting for `ActiveRecord` Queries

Project Site <http://pablotron.org/software/wirble/>
Project Site <http://tagaholic.me/2009/03/13/hirb-irb-on-the-good-stuff.html>

Install:

    sudo gem install wirble hirb
    
Configure by adding the following lines to `~/.irbrc`

    %w|rubygems wirble hirb|.each do|lib|
      begin
        require lib
      rescue LoadError => err
        warn "Couldn't load an irb gem: #{err}"
      end
    end

    # wirble (colors)
    Wirble.init
    Wirble.colorize

    # hirb (active record)
    Hirb::View.enable

    # IRB Options
    IRB.conf[:AUTO_INDENT] = true

