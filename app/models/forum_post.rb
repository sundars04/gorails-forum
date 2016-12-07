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
  def send_notifications!
    # Identify all the unique users in this thread
    users = forum_thread.users.uniq - [user]
    # Send an email to each of those users
    users.each do |user|
      NotificationMailer.forum_post_notification(user, self).deliver_later
    end    
  end
end
