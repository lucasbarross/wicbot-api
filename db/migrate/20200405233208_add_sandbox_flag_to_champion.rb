class AddSandboxFlagToChampion < ActiveRecord::Migration[6.0]
  def change
    add_column :champions, :sandbox, :boolean, default: false
  end
end
