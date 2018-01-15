class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.string :champion_name
      t.string :representation

      t.timestamps
    end
  end
end
