json.extract! teacher_request, :id, :teacher_id, :description, :closed_at, :created_at, :updated_at
json.url teacher_request_url(teacher_request, format: :json)