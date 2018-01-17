class CreateGuilds < ActiveRecord::Migration[5.1]
  def change
    create_table :guilds do |t|
      t.string :guild_id
      t.string :name
      t.string :nationality

      t.timestamps
    end
  end
end
