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
#

class VirtualTourism < ActiveRecord::Base
  has_attached_file :video,
                    styles: {
                        thumb: { geometry: "160x120#", format: 'jpg', time: 10 }
                    },
                    processors: [:transcoder]

  validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/
  validates_presence_of :video

  def video_thumb
    self.video.try(:url).try(:gsub, /\/original\//, '/thumb/').try(:gsub, /(\.[a-z|A-Z]*$)/, '.jpg')
  end
end
