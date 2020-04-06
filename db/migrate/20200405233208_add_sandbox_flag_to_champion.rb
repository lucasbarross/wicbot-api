class AddSandboxFlagToChampion < ActiveRecord::Migration[5.1]
  def change
    add_column :champions, :sandbox, :boolean, default: false
  end
end
