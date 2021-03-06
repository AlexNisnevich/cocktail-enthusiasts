# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  topic_id    :integer
#  user_id     :integer
#

class Comment < ActiveRecord::Base
   attr_accessible :description, :topic, :topic_id, :user, :user_id
   
   belongs_to :topic
   belongs_to :user
   
   validates_presence_of :description
   
   def username
     user.name rescue ""
   end
   
   def logged_in_as_author (user_id)
    current_user = User.find(user_id) rescue nil
    user == nil or user == current_user
   end
end
