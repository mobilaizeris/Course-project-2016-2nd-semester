class ReposFile < ActiveRecord::Base
	has_attached_file :file,
										styles: { thumb: ["120x120#", :png] }
	do_not_validate_attachment_file_type :file

	validates :file, attachment_presence: true
end
