ActiveAdmin.register ShipmentFee do
  menu parent: '订单管理'

  permit_params :province_id, :city_id, :destination_name, :price

  index do
    selectable_column
    id_column
    column :destination_name
    column :price
    column :created_at
    actions
  end

  filter :destination_name
  filter :price
  filter :created_at

  form do |f|
    f.inputs "详情" do
      f.input :province, as: :select, collection: Province.all.map { |province|
                         [province.name, province.id, {"data-province-id" => province.id}]
                       }, input_html: {
                           onchange: "
                                        var province = $(this).find('option:selected').attr('data-province-id');

                                        $('#shipment_fee_city_id').val(0).find('option').each(function(){
                                          var $option = $(this),
                                            isCorrectProvince = ($option.attr('data-province-id') === province);
                                            $option.prop('hidden',!isCorrectProvince);
                                        });
                                      "
                       }
      f.input :city, as: :select, collection: City.all.map { |city|
                     [city.name, city.id, {"data-province-id" => city.province_id}]
                   }
      f.input :price
    end
    f.actions
  end

end
