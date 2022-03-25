class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true  do
    validates :nickname
    validates :email
    validates :password, format: {with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
    validates :encrypted_password
    validates :birthday
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :last_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :first_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
  end

end

# devise側のバリデーションによってemailは空白ダメ、一意性、@を含むという制限が設けられている
# パスワード側の制限は空白ダメ、6文字以上128文字以下であること