class AddTitleCatToPublicationpages < ActiveRecord::Migration
  def change
    add_column :publicationpages, :title, :string
    add_column :publicationpages, :cat, :string
  end
end
