module V1
	module Entities
		module Responder
			class Detail < Grape::Entity
				format_with(:iso_timestamp) { |dt| dt.iso8601 }
				expose :contact

				with_options(format_with: :iso_timestamp) do
					expose :eta
				end
			end
		end
	end
end