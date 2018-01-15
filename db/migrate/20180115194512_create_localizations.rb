class CreateLocalizations < ActiveRecord::Migration[5.1]
  def change
    create_table :localizations do |t|
      t.string :lang
      t.string :hash
      t.string :text

      t.timestamps
    end
  end
end
