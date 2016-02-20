# == Schema Information
#
# Table name: jobs
#
#  id      :integer          not null, primary key
#  title   :string(255)
#  text    :text(65535)
#  company :string(255)
#

class Job < ActiveRecord::Base
end
