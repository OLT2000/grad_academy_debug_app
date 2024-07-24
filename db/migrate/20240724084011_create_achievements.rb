class CreateAchievements < ActiveRecord::Migration[7.1]
  def change
    create_table :achievements do |t|
      t.string :achievement_title, null: false
      t.text :achievement_description

      t.timestamps
    end
    add_index :achievements, :achievement_title, unique: true
  end
end
