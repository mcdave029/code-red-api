class Base < Grape::API
	prefix 'api'
	version 'v1', using: :path
	mount V1::Root
end