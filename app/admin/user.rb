ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :name, :score, :team_id, :email, :is_lead, :password, :password_confirmation

  index do
    selectable_column
    column "Name" do |u|
      div :class => "resource_general_column" do
        u.name
      end
    end
    column "Email" do |u|
      div :class => "resource_general_column" do
        u.email
      end
    end
    column "Score" do |u|
      div :class => "resource_general_column" do
        u.score
      end
    end
    column "Team" do |u|
      div :class => "resource_general_column" do
	      u.team_name
      end
	  end
    column "Team Leader" do |u|
      div :class => "resource_general_column" do
        u.is_lead
      end
    end
    actions
  end

  show do 
    attributes_table do
      row :name
      row :email
      row :score
      row('Team') {|u| u.team_name} 
      row('Team Leader') {|u| u.is_lead}
    end
  end


  filter :name
  filter :email
  filter :score
  # filter :team_id, :as => :select, :collection => Team.all.map {|u| [u.name, u.id]}

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :score
      f.input :team_id, :as => :select, :collection => Team.all.map {|u| [u.name, u.id]}, :include_blank => false
      f.input :is_lead, :label => "Team Leader"
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end


  # Allow to update user without password
  controller do
 
    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
 
  end

end
