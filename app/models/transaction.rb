# == Schema Information
#
# Table name: transactions
#
#  id               :integer          not null, primary key
#  order_id         :integer
#  pingpp_id        :string(255)
#  status           :string(255)
#  transaction_type :string(255)
#  amount           :float(24)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Transaction < ActiveRecord::Base
end
