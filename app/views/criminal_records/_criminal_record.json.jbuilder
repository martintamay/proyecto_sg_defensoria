json.extract! criminal_record, :id, :procedural_stage, :inquire_number, :intervention_date, :type_of_crime, :commission_place, :commission_date, :prosecutor_unit, :precautionary_measures, :legal_case_id, :created_at, :updated_at
json.url criminal_record_url(criminal_record, format: :json)
