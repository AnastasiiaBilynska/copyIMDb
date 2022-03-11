class Movie < ApplicationRecord
  ratyrate_rateable 'rating'
  belongs_to :category
  has_many :reviews
  mount_uploader :preview, PreviewUploader
end
