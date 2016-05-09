# == Schema Information
#
# Table name: line_items
#
#  id           :integer          not null, primary key
#  order_id     :integer
#  product_id   :integer
#  quantity     :integer
#  unit_price   :float(24)
#  state        :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  handle_state :string(255)
#

class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
end
