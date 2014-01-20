class UserRole < ActiveRecord::Base

   attr_accessible :user_id, :role_id, :created_at, :updated_at


   belongs_to :role
   belongs_to :user
end
