# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  company     :string(255)
#

class Job < ActiveRecord::Base
end
