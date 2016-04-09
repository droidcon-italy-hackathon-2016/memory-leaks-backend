class User < ActiveRecord::Base
  has_many :elders, foreign_key: 'child_id', class_name: 'Relative'
  has_many :childs, foreign_key: 'elder_id', class_name: 'Relative'
end
