class CreateSkillSuggestions < ActiveRecord::Migration
  def change
    create_table :skill_suggestions do |t|
      t.string :skill
      t.string :resume_doc_guid
      t.string :bid

      t.timestamps
    end
  end
end
