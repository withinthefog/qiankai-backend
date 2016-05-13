class AddProvinceIdAndCityIdToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :province_id, :integer
    add_column :addresses, :city_id, :integer
  end
end
