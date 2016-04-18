module V1
	module Entities
		module Report
			class View < Grape::Entity
				expose :id, :classification, :is_report, :status
				expose :address_detail do
					expose :address, :latitude, :longitude
				end
				expose :respondee, using: V1::Entities::Users::RegistrationCredentials
			end
			class WithResponders < View
				expose :responders_listing, using: V1::Entities::Responder::Detail
				unexpose :respondee
			end
		end
	end
end