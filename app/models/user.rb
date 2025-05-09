class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :books, dependent: :destroy
  before_save :downcase_email

  validates :name, presence: true,length: { in: 2..20 }, uniqueness: true
  validates :introduction, length: { maximum: 50}

  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [100,100]).processed
  end

  private

    def downcase_email
      self.email = self.email.downcase
    end
   
end
