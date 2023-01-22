json.extract! thecomment, :id, :created_at, :updated_at
json.url thecomment_url(thecomment, format: :json)
