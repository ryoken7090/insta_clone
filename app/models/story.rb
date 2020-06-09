class Story < ApplicationRecord
  validates :image_or_content, presence:true

  private
  def image_or_content
    image.presence or content.presence
  end
end
