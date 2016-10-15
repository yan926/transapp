class AddCatToCcspublications < ActiveRecord::Migration
  def change
    add_column :ccspublications, :cat, :string
  end
end
