class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    #1:N の「1」側にあたるモデルに、has_many を記載する必要がある
    has_many :post_images, dependent: :destroy
    has_many :post_comments, dependent: :destroy
    has_one_attached :profile_image
    has_many :favorites, dependent: :destroy

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    #以下のコードは画像サイズの変更を行っている。以下の場合上下ともに、100pxになっている。
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
