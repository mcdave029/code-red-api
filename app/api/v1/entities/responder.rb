module V1
	module Entities
		module Responder
			class Detail < Grape::Entity
				expose :contact, :eta

				private
					def eta
						"About #{object.eta} minutes"	
					end
			end
		end
	end
end