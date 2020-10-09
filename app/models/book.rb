class Book < ApplicationRecord

  # 検索メソッド
  def self.search(search_text,select_model,select_part)
    if select_part == "perfect"
      @books = Book.where(title: search_text)
    elsif select_part == "front"
      @books = Book.where("title LIKE?","#{search_text}%")
    elsif select_part == "back"
      @books = Book.where("title LIKE?","%#{search_text}")
    elsif select_part == "partial"
      @books = Book.where("title LIKE?","%#{search_text}%")
    else
      @books = Book.all
    end
  end

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { in: 1..200 }

end
