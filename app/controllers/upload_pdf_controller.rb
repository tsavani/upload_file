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

	private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:upload).permit(:file)
    end

end
