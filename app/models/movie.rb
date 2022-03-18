class Movie < ApplicationRecord
  belongs_to :category
  has_many :reviews
  mount_uploader :preview, PreviewUploader

  validates :title, presence: true,
            uniqueness: { case_sensitive: false }, length: { minimum: 2, maximum: 80 }
  validates :text, presence: true,
            length: { minimum: 10, maximum: 500 }

end
