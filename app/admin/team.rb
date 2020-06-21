ActiveAdmin.register Team do
  permit_params :name, :goal_date

  index do
    selectable_column
    column "Name" do |t|
      div :class => "resource_general_column" do
        t.name
      end
    end
    column "Score" do |t|
      div :class => "resource_general_column" do
        t.score
      end
    end
    column "Goal Date" do |t|
      div :class => "resource_general_column" do
        t.goal_date
      end
    end
    column "Leader" do |t|
      div :class => "resource_general_column" do
        t.team_leader_name
      end
    end
    actions
  end

  show do 
    attributes_table do
      row :name
      row :score
      row :goal_date
      row('# of Members') {|t| User.where(:team_id => t.id).count}
      row("Leader") {|t| t.team_leader_name}
    end
  end

  filter :name
  filter :score
  filter :goal_date

  form do |f|
    f.inputs "Team Details" do
      f.input :name
      f.input :goal_date
    end
    f.actions
  end

end
