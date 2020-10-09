class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  attachment :profile_image

  validates :name, presence: true
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
  
  # 検索メソッド
  def self.search(search_text,select_model,select_part)
    if select_part == "perfect"
      @users = User.where(name: search_text)
    elsif select_part == "front"
      @users = User.where("name LIKE?","#{search_text}%")
    elsif select_part == "back"
      @users = User.where("name LIKE?","%#{search_text}")
    elsif select_part == "partial"
      @users = User.where("name LIKE?","%#{search_text}%")
    else
      @users = User.all
    end
  end



end
