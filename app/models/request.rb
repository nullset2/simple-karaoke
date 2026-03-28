class Request < ApplicationRecord
  validates :song_name, presence: true, length: {in:1..100}
  attribute :active, :boolean, default: true
  attribute :rank, :integer, default: 0
  belongs_to :user
end
