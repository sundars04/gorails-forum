# == Schema Information
#
# Table name: forum_threads
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  subject    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ForumThread < ApplicationRecord
  belongs_to :user
  has_many :forum_posts, inverse_of: :forum_thread
  has_many :users, through: :forum_posts
  has_many :likes

  accepts_nested_attributes_for :forum_posts,
                                reject_if: proc { |attributes| attributes[:body].blank? },
                                allow_destroy: true

  validates :subject, presence: true
  validates_associated :forum_posts

end
