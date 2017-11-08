json.extract! legal_case, :id, :entry_form, :name, :user_id, :court_id, :judge_id, :suspect_id, :comment, :final_sentence, :created_at, :updated_at
json.url legal_case_url(legal_case, format: :json)
