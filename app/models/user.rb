class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    #1:N の「1」側にあたるモデルに、has_many を記載する必要がある
    has_many :post_iamges, dependent: :destroy
end
