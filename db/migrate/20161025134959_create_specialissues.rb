class CreateSpecialissues < ActiveRecord::Migration
  def change
    create_table :specialissues do |t|
      t.text :body
      t.string :language
      t.string :title

      t.timestamps
    end
  end
end
