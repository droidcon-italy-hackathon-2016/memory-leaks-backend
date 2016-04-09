class User < ActiveRecord::Base
  has_many :relatives, through: :user_relatives, class_name: 'User'
  has_many :user_relatives
end
