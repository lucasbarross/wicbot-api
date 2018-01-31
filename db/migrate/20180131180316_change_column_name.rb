class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :localizations, :hash, :hash_text
  end
end
