class CreateCcspublications < ActiveRecord::Migration
  def change
    create_table :ccspublications do |t|
      t.text :body
      t.string :language

      t.timestamps
    end
  end
end
