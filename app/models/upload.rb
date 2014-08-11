class Upload < ActiveRecord::Base

	validates :file_file_name ,:file_content_type, :file_file_size, :presence => true
	has_attached_file :file, 
     :path => ":rails_root/public/uploads/pdf/:filename",
     :url => "/uploads/pdf/:filename"
     # validates_attachment :attach, :presence => true,
     #                     :content_type => { :content_type => "application/pdf" }
     validates_attachment_content_type :file, :content_type =>["application/pdf"]
     validates_uniqueness_of :file_file_name
end
