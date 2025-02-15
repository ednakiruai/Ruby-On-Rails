class Book < ApplicationRecord
  # Validations to ensure required fields are present and ISBN is unique
  validates :title, :author, :isbn, presence: true
  validates :isbn, uniqueness: true

  # Add available attribute to track if the book is available for borrowing
  validates :available, inclusion: { in: [true, false] }

  # Scope to get available books
  scope :available_books, -> { where(available: true) }
end


class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # Validations to ensure due_date is present and book is returned when borrowing is done
  validates :due_date, presence: true
  validates :returned, inclusion: { in: [true, false] }
end


class User < ApplicationRecord
  # Devise authentication
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Associations
  has_many :borrowings
  has_many :books, through: :borrowings
end


