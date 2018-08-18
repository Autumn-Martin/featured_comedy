class Special < ActiveRecord::Base
  # belongs_to :comedian
  validates :name, presence: true
end
