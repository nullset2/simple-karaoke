class Request < ApplicationRecord
  before_create :assign_rank
  validates :song_name, presence: true, length: {in:1..100}
  attribute :active, :boolean, default: true
  attribute :rank, :integer, default: 0
  belongs_to :user

  private

  def assign_rank
    self.rank = (self.class.maximum(:rank) || 0) + 1
  end
end
