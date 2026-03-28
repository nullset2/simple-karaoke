json.extract! request, :id, :song_name, :user_id, :active, :rank, :created_at, :updated_at
json.url request_url(request, format: :json)
