class CreateSurveys < ActiveRecord::Migration[5.2]
  def up
    create_table :surveys do |t|

      t.string :title
      t.string :description
      t.string :access_code

      t.integer :status, default: 0
      t.integer :state, default: 0
      t.timestamps
    end

    Elko::Block.create(title: "Surveys", controller: "surveys")
  end

  def down
    Elko::Block.find_by_title("Surveys").destroy
    drop_table :surveys
  end
end