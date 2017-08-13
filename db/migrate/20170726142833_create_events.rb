class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title, null: false, limit: 255
      t.string :event_type, null: false
      t.timestamp :date, null: false
      t.string :description, limit: 500
      t.references :user, nill: false

      t.timestamps null: false
    end
  end
end
