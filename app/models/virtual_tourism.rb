# == Schema Information
#
# Table name: virtual_tourisms
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  description        :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  video_file_name    :string(255)
#  video_content_type :string(255)
#  video_file_size    :integer
#  video_updated_at   :datetime
#  video_url          :string(255)
#  thumb_url          :string(255)
#

class VirtualTourism < ActiveRecord::Base
  has_attached_file :thumb_nail,
                    styles: {
                        small: "300x400>"},
                    processors: [:thumbnail, :compression]
  validates_attachment :thumb_nail, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

  # has_attached_file :video

  # validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/
  # validates_presence_of :video

  # def video_thumb
  #   self.video.try(:url).try(:gsub, /\/original\//, '/thumb/').try(:gsub, /(\.[a-z|A-Z]*$)/, '.jpg')
  # end
end
