class CreateElkoUserBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :elko_user_blocks do |t|
      t.references :elko_user, foreign_key: true
      t.references :block, foreign_key: true

      t.timestamps
    end
  end
end
