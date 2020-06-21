ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    # id_column
    column "Email" do |u|
      div :class => "resource_general_column" do
        u.email
      end
    end
    column "Current Sign In At" do |u|
      div :class => "resource_general_column" do
        u.current_sign_in_at
      end
    end
    column "Sign In Count" do |u|
      div :class => "resource_general_column" do
        u.sign_in_count
      end
    end
    column "Created At" do |u|
      div :class => "resource_general_column" do
        u.created_at
      end
    end
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
