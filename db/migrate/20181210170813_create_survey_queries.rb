class CreateSurveyQueries < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_queries do |t|
      t.string :query
      t.timestamps
    end
  end
end
