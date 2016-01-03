class News < ActiveRecord::Base
  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments, allow_destroy: true
end
