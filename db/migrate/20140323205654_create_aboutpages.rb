class CreateAboutpages < ActiveRecord::Migration
  def change
    create_table :aboutpages do |t|
      t.string :title
      t.text :body
      t.string :language

      t.timestamps
    end
  end
end
