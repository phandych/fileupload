class Course < ActiveRecord::Base
    has_attached_file :upload, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :upload, content_type: /\Aimage\/.*\Z/
  
    def to_jq_upload(error=nil)
        {
          files: [
            {
              name: read_attribute(:upload_file_name),
              size: read_attribute(:upload_file_size),
              url: upload.url(:original),
              delete_url: Rails.application.routes.url_helpers.course_path(self),
              delete_type: "DELETE" 
            }
          ]
        }
    end
end
