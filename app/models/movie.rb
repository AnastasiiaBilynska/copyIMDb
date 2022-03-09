class Movie < ApplicationRecord
  belongs_to :category
  has_many :reviews
  mount_uploader :preview, PreviewUploader
  ratyrate_rateable 'rating'
end
