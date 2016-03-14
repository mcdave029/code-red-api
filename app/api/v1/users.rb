module V1
	class Users < Grape::API
		resource :users do
			desc "List of Respondees"

			get do
				User.all
			end
		end
	end
end