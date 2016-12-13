# == Schema Information
#
# Table name: likes
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  forum_thread_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Like < ApplicationRecord
  belongs_to :user, inverse_of: :likes
  belongs_to :forum_thread, inverse_of: :likes
end
