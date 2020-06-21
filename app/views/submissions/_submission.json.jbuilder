json.extract! submission, :id, :donor_name, :address, :email, :phone, :payment_info, :credit_card, :expire_year, :expire_month, :ccv, :comment, :number_of_sfd, :submitted_by, :created_at, :updated_at
json.url submission_url(submission, format: :json)
