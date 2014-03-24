class CreatePublicationpages < ActiveRecord::Migration
  def change
    create_table :publicationpages do |t|
      t.text :body
      t.string :language

      t.timestamps
    end
  end
end
