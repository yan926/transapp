class CreateEventpages < ActiveRecord::Migration
  def change
    create_table :eventpages do |t|
      t.text :body
      t.string :language

      t.timestamps
    end
  end
end
