class Request < ApplicationRecord
    belongs_to :user

    validates :song_name, presence: true, length: {in: 1..100}
end
