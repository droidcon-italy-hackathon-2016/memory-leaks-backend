class Relative < ActiveRecord::Base
  belongs_to :elder, class_name: 'User'
  belongs_to :child, class_name: 'User'
end
