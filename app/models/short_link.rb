class ShortLink < ApplicationRecord
  validates :original_url, presence: true

  before_create :convert_to_short_link

  private

  def convert_to_short_link
    self.short_url = Array.new(6){[*"a".."z", *"0".."9"].sample}.join
  end
end
