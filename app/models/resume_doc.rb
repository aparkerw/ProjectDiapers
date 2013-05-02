class ResumeDoc < ActiveRecord::Base
  attr_accessible :original_resume_html, :owner_name, :private_guid, :safe_resume_html
end
