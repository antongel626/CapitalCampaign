class SubmissionsController < InheritedResources::Base

  private

    def submission_params
      params.require(:submission).permit(:donor_name, :address, :email, :phone, :payment_info, :credit_card, :amount, :comment, :number_of_sfd, :submitted_by)
    end
end