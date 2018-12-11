class CreateAnswers < ActiveRecord::Migration[5.2]
  def up
    create_table :answers do |t|

      t.string     :title
      t.integer    :number_of_times_chosen, default: 0
      t.references :question, index: true
      t.timestamps
    end
  end

  def down
    drop_table :answers
  end
end