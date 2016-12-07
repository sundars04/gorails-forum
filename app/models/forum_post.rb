# == Schema Information
#
# Table name: forum_posts
#
#  id              :integer          not null, primary key
#  forum_thread_id :integer
#  user_id         :integer
#  body            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ForumPost < ApplicationRecord
  belongs_to :forum_thread, inverse_of: :forum_posts
  belongs_to :user

  validates :body, presence: true
end
