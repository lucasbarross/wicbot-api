class DropGuildsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :guilds do |t|
      t.string :server_id
      t.string :name
      t.string :nationality

      t.timestamps
    end
  end
end
