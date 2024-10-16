class Post < ApplicationRecord
  belongs_to :user
  has_many :comments,dependent: :destroy
  has_many :favorites,dependent: :destroy

  has_one_attached :image

  def get_image(width,height)
    unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id:user.id)
  end


  def self.search_for(search,word)
    if search=="perfect"
      Post.where(knittingname: word)
    elsif search=="forward"
      Post.where("knittingname LIKE?",word+"%")
    elsif search=="backward"
      Post.where("knittingname LIKE?","%"+word)
    else search=="partial"
      Post.where("knittingname LIKE?","%"+word+"%")
    end
  end

end
