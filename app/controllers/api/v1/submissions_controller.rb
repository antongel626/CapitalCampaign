class Api::V1::SubmissionsController < Api::V1::BaseController
  
  before_action :authenticate_with_token!, only: [:index, :show, :create, :update, :destroy]

  include ActiveHashRelation

  def index
    submissions = Submission.all

    submissions = apply_filters(submissions, params)
    
    render(
      json: ActiveModel::Serializer::CollectionSerializer.new(
        submissions,
        serializer: Api::V1::SubmissionSerializer,
        root: 'teams',
      )
    )
  end

  def show
    submission = Submission.find(params[:id])
    render(json: Api::V1::SubmissionSerializer.new(submission).to_json)
  end

  def create
    submission = Submission.new
    submission.donor_name = submission_params[:donor_name]
    submission.address = submission_params[:address]
    submission.email = submission_params[:email]
    submission.phone = submission_params[:phone]
    submission.payment_info = submission_params[:payment_info]
    submission.credit_card = submission_params[:credit_card]
    submission.amount = submission_params[:amount]
    submission.comment = submission_params[:comment]
    submission.number_of_sfd = submission_params[:number_of_sfd]
    submission.submitted_by = submission_params[:submitted_by]

    submission.save

    render json: Api::V1::SubmissionSerializer.new(submission).to_json, status: 200
  end

  def submission_params
    # whitelist params
    params.require(:submission).permit(:donor_name, :address, :email, :phone, :payment_info, :credit_card, :amount, :comment, :number_of_sfd, :submitted_by)
  end

end