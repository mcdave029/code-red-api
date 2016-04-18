module V1
	class Reports < Grape::API

		helpers do
			def report_params
	      ActionController::Parameters.new(params).require(:report).permit(:name, :is_report, :latitude, :longitude, :address, :classification)
	    end
	  end

      resource :reports do
         desc "Close Report"
         post '/:id/close' do
            present Report.find(params[:id]).closed!, with: V1::Entities::Report::View
         end

         get do
            present current_user.reports.last, with: V1::Entities::Report::WithResponders
         end

         desc "Create User Reports"
         post do
            report = current_user.reports.build(report_params)
            if report.save
               current_user.reports.where("status = ? AND ID != ?",0,report.id).update_all(status:1)
               present report, with: V1::Entities::Report::WithResponders
            else
               error!("Your report cannot be submitted please make sure to fill up all the fields", 401)
            end
         end

      end

	end
end