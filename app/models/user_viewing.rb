class UserViewing < ApplicationRecord
  belongs_to :user
  belongs_to :viewing

  validates :viewing_id, uniqueness: {
    scope: :user_id,
    message: "est déjà dans votre bibliothèque"
  }
end
