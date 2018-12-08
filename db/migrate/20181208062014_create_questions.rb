class CreateQuestions < ActiveRecord::Migration[5.2]
  def up
    create_table :questions do |t|

      t.string :title
      t.references :survey, index: true
      t.timestamps
    end
  end

  def down
    drop_table :questions
  end
end