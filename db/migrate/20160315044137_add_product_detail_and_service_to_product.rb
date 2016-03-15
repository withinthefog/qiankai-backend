class AddProductDetailAndServiceToProduct < ActiveRecord::Migration
  def change
    add_column :products, :product_detail_file_name, :string
    add_column :products, :product_detail_content_type, :string
    add_column :products, :product_detail_file_size, :integer
    add_column :products, :product_detail_updated_at, :datetime

    add_column :products, :service_file_name, :string
    add_column :products, :service_content_type, :string
    add_column :products, :service_file_size, :integer
    add_column :products, :service_updated_at, :datetime
  end
end
