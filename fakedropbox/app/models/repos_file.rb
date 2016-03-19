class ReposFile < ActiveRecord::Base
	has_attached_file :file
	do_not_validate_attachment_file_type :file

	validates :file, attachment_presence: true
end
