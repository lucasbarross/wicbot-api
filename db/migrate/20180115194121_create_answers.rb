class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :player
      t.references :champion, foreign_key: true
      t.boolean :correct
      t.boolean :hinted

      t.timestamps
    end
  end
end
