class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :from_id, null: false
      t.integer :to_id, null: false

      t.text :content

      t.timestamps
    end
  end
end
