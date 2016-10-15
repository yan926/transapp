class AddTileToCcspublications < ActiveRecord::Migration
  def change
    add_column :ccspublications, :title, :string
  end
end
