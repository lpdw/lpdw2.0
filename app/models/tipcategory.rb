class Tipcategory < ActiveRecord::Base
  validates :title, presence: true
end
