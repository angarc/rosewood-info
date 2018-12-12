class CreateAuthorizedEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :authorized_entries do |t|
      t.string :identification
      t.timestamps
    end
  end
end
