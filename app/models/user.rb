class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # bookモデルに対してNの関係
  has_many :books, dependent: :destroy
  attachment :profile_image # （_idは含めません）

  validates :name, presence: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }



end
