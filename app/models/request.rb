class Request < ApplicationRecord
  after_create_commit  -> { broadcast_requests }
  after_update_commit  -> { broadcast_requests }
  after_destroy_commit -> { broadcast_requests }

  before_create :assign_rank
  validates :song_name, presence: true, length: {in:1..100}
  attribute :active, :boolean, default: true
  attribute :rank, :integer, default: 0
  belongs_to :user

  private

  def broadcast_requests
    requests = Request.order(rank: :asc)
    html = ApplicationController.render(
      partial: "requests/admin_queue",
      locals: { requests: requests }
    )
    tv = ApplicationController.render(
      partial: "requests/tv",
      locals: { requests: requests }
    )
    ActionCable.server.broadcast("requests_channel", { html: html })
    ActionCable.server.broadcast("tv_channel", { html: tv })
  end

  def assign_rank
    self.rank = (self.class.maximum(:rank) || 0) + 1
  end
end
