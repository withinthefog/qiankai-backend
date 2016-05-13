# == Schema Information
#
# Table name: free_shipment_coupons
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  min_price  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FreeShipmentCoupon < ActiveRecord::Base
end
