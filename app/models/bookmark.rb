require 'data_mapper'
require 'dm-postgres-adapter'

class Bookmark

	include DataMapper::Resource

	property :url,        String
	property :id,         Serial
  property :name,       String

	has n, :tags, :through => Resource

end
