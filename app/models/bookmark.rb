require 'data_mapper'
require 'dm-postgres-adapter'

class Bookmark

	include DataMapper::Resource

	property :url,        String
	property :id,         Serial
  property :name,       String

end

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmarks_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate!
