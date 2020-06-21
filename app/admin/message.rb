ActiveAdmin.register Message do
  permit_params :from, :content, :updated_at, {to: []}, {to_users: []}, {to_teams: []}

  actions :all, :except => [:edit]

  index do
    selectable_column
    column "To" do |m|
      div :class => "resource_general_column" do
        m.string_for_to
      end
    end
    column "From" do |m|
      div :class => "resource_general_column" do
        m.string_for_from
      end
    end
    column "Message" do |m|
      div :class => "resource_msg_column" do
        m.content
      end
    end
    column "Updated At" do |m|
      div :class => "resource_general_column" do
        m.updated_at
      end
    end
    actions
  end

  show do 
    attributes_table do
      row "To" do |m|
        m.string_for_to
      end
      row "From" do |m|
        m.string_for_from
      end
      row :content
      row :updated_at
    end
  end

  filter :content

  form do |f|
    f.inputs "Message Details" do
      # "If 'To' is Empty send message to ALL"
      # f.input :to, :as => :check_boxes, :multiple => true, :collection => User.all.map {|u| [u.name, u.id]}, :include_blank => false
      f.input :to_users, :as => :tags, :collection => User.all, display_name: :name, label: "To Members"
      f.input :to_teams, :as => :tags, :collection => Team.all, display_name: :name, label: "To Teams"
      # f.input :from
      f.input :content
    end
    f.actions
  end

  before_save do |message|
    message.to_users.each do |u|
      message.to_users.delete(u) if u == ""
    end
    message.to_teams.each do |t|
      message.to_teams.delete(t) if t == ""
    end
    if message.from.nil? || message.from.length == 0
      message.from = "admin"
    end
  end

end
