module V1
	class Reports < Grape::API

		helpers do
			def report_params
	      ActionController::Parameters.new(params).require(:report).permit(:name, :lat, :lng, :address, :classification)
	    end
	  end

   	resource :user do 
   		desc "View Report"
   		get 'report/:id' do
   			present Report.find(params[:id]), with: V1::Entities::Report::View
   		end

   		desc "Create User Reports"
   		params do
   			requires :report, type: Hash do
	   			requires :name, type: String
	   			requires :lat, type: String
	   			requires :lng, type: String
	   			requires :address, type: String
	   			requires :classification, type: String
	   		end
   		end

   		post 'report' do
   			report = current_user.reports.build(report_params)
   			if report.save
	   			present report, with: V1::Entities::Report::View
   			else
   				error!("Your report cannot be submitted please make sure to fill up all the fields", 401)
   			end
   		end
   	end

	end
end