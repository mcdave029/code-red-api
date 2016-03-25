module V1
	class Root < Grape::API
		version 'v1'
    format :json

    mount V1::AuthLess
    mount V1::AuthRequired
	end
end