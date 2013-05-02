class CreateResumeDocs < ActiveRecord::Migration
  def change
    create_table :resume_docs do |t|
      t.string :owner_name
      t.text :original_resume_html
      t.text :safe_resume_html
      t.string :private_guid

      t.timestamps
    end
  end
end
