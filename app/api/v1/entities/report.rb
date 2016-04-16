module V1
	module Entities
		module Report
			class View < Grape::Entity
				expose :classification, :address, :is_report, :status
				expose :respondee, using: V1::Entities::Users::RegistrationCredentials
			end
			class WithResponders < View
				expose :responders_listing, using: V1::Entities::Responder::Detail
				unexpose :respondee
			end
		end
	end
end