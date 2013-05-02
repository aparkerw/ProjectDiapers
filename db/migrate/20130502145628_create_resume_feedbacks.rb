class CreateResumeFeedbacks < ActiveRecord::Migration
  def change
    create_table :resume_feedbacks do |t|
      t.string :name
      t.string :feedback_type
      t.string :resume_doc_guid
      t.text :note
      t.string :bid
      t.text :json_data

      t.timestamps
    end
  end
end
