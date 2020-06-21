ActiveAdmin.register Submission do
  permit_params :submitted_by, :donor_name, :address, :email, :phone, :payment_info, :credit_card, :amount, :comment, :number_of_sfd

  index do
    selectable_column 
    column "Submitted By" do |submission|
      div :class => "resource_general_column" do
        submission.submitted_by_name
      end
  	end
    column "Donor Name" do |s|
      div :class => "resource_general_column" do
        s.donor_name
      end
    end
    column "Amount" do |s|
      div :class => "resource_general_column" do
        s.amount
      end
    end
    column "Comment" do |s|
      div :class => "resource_general_column" do
        s.comment
      end
    end
    actions
  end

  show do 
    attributes_table do
      row :donor_name
      row :address
      row :email
      row :amount
      row :phone
      row :payment_info
      row :credit_card
      row :comment
      row :number_of_sfd
      row('Submitted By') {|submission| submission.submitted_by_name } 
    end
  end

  # filter :submitted_by, :as => :select, :collection => User.all.map {|u| [u.name, u.id]}
  filter :donor_name
  filter :amount

  form do |f|
    f.inputs "Submission Details" do
      f.input :submitted_by, :as => :select, :collection => User.all.map {|u| [u.name, u.id]}
      f.input :donor_name
      f.input :address
      f.input :email
      f.input :amount
      f.input :phone
      f.input :payment_info
      f.input :credit_card
      f.input :comment
      f.input :number_of_sfd
    end
    f.actions
  end

end
