class Book < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :book_comments, dependent: :destroy

  validates :title, presence: true
  # presence: true=指定された項目（ここではタイトル）が空か確認するためのコード
  validates :body, presence: true, length: { maximum: 200 }
end

