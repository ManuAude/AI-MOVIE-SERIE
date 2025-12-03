class Viewing < ApplicationRecord
  validates :title, uniqueness: true
end
