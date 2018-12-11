class CreateAuthorizedSurveyeesLists < ActiveRecord::Migration[5.2]
  def up
    create_table :authorized_surveyees_lists do |t|
      t.string :identification_type
      t.text   :list
      t.timestamps
    end
  end

  def down
    drop_table :authorized_surveyees_lists
  end
end