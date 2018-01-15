class CreateGuildPreferences < ActiveRecord::Migration[5.1]
  def change
    create_table :guild_preferences do |t|
      t.references :guild, foreign_key: true
      t.string :lang

      t.timestamps
    end
  end
end
