class Api::V1::SubmissionSerializer < Api::V1::BaseSerializer
  attributes :id, :donor_name, :address, :email, :phone, :payment_info, :credit_card, :amount, :comment, :number_of_sfd, :submitted_by
end
