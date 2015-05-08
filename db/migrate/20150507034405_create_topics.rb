class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.boolean :public
      t.text :description, default: true

      t.timestamps null: false
    end
  end
end
