class CreateElkoBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :blocks do |t|
      t.string :title
      t.string :controller
      t.timestamps
    end
  end
end
