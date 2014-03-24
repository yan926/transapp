class CreateScopepages < ActiveRecord::Migration
  def change
    create_table :scopepages do |t|
      t.text :body
      t.string :language

      t.timestamps
    end
  end
end
