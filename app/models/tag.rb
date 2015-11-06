require 'data_mapper'
require 'dm-postgres-adapter'

class Tag

	include DataMapper::Resource

	property :id,         Serial
	property :name,       String


	has n, :bookmarks, :through => Resource

end
