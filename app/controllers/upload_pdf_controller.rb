class UploadPdfController < ApplicationController
	def index

	end

	def upload_file
		@upload_pdf = Upload.new(user_params)
   	if @upload_pdf.save
   		flash[:notice] = "File upload successful."
   	else
   		flash[:error] = "File upload Error."
   	end
   	redirect_to root_path
	end

	def download
		send_file Rails.root.join("public/uploads/#{params[:type].to_s}/#{params[:filename].to_s}")
		#send_file(Rails.root.join('public','uploads', "#{params[:type].to_s}", "#{params[:filename].to_s}"))
	end

	private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:upload).permit(:file)
    end

end
