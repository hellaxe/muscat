class AddFieldsToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :country, :string
    add_column :artists, :city, :string
    add_column :artists, :formed_date, :date
    add_column :artists, :disbanded_date, :date
  end
end
