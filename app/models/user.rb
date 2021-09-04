class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  


  with_options presence: true do
   validates :nickname
   validates :birthday
   with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
      validates :name
      validates :last_name
    end
    with_options presence: true, format: { with: /[a-z\d]{6,}/i, message: '6文字以上で半角英数字混合での入力' } do
      validates :password
    end
    with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角（カタカナ）を使用してください' } do
      validates :name_furigana
      validates :last_name_furigana
    end
  end

end