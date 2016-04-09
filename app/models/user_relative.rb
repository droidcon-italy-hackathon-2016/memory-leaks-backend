class UserRelative < ActiveRecord::Base
  belongs_to :user
  belongs_to :relative, class_name: 'User'
end
