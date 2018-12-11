class CreateFeatures < ActiveRecord::Migration[5.2]
  def up
    create_table :features do |t|

      t.string :name
      t.text   :description
      t.string :icon
      t.integer :status, default: 0
      t.timestamps
    end

    Elko::Block.create(title: "Features", controller: "features")
  end

  def down
    Elko::Block.find_by_title("Features").destroy
    drop_table :features
  end
end