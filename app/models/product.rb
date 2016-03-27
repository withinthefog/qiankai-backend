# == Schema Information
#
# Table name: products
#
#  id                          :integer          not null, primary key
#  name                        :string(255)
#  image_url                   :string(255)
#  description                 :string(255)
#  price                       :string(255)
#  created_at                  :datetime
#  updated_at                  :datetime
#  link                        :string(255)
#  hot                         :boolean
#  product_detail_file_name    :string(255)
#  product_detail_content_type :string(255)
#  product_detail_file_size    :integer
#  product_detail_updated_at   :datetime
#  service_file_name           :string(255)
#  service_content_type        :string(255)
#  service_file_size           :integer
#  service_updated_at          :datetime
#

class Product < ActiveRecord::Base
  scope :hot, -> () {
    where(hot: true)
  }

  has_and_belongs_to_many :tags
  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments, allow_destroy: true

  has_attached_file :product_detail,
                    styles: {
                        large: "600x800>",
                        small: "300x400>"},
                    processors: [:thumbnail, :compression]
  validates_attachment :product_detail, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  delegate :path, :url, :content_type, to: :product_detail

  has_attached_file :service,
                    styles: {
                        large: "600x800>",
                        small: "300x400>"},
                    processors: [:thumbnail, :compression]
  validates_attachment :service, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  delegate :path, :url, :content_type, to: :service

  has_many :line_items
  has_many :orders, through: :line_items
  belongs_to :customer
end
