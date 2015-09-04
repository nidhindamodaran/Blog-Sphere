class Article < ActiveRecord::Base
  belongs_to :user
  VALID_TITLE = /\A[A-Z][a-zA-Z0-9]+\z/
  validates :title, presence: true, length: { minimum: 5 }, format: { with: VALID_TITLE , message: "Title must start with block letter "}
end
