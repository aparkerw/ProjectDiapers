class ResumeFeedback < ActiveRecord::Base
  attr_accessible :bid, :feedback_type, :json_data, :name, :note, :resume_doc_guid
end
