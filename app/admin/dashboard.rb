ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do

      teams = Team.order('id desc')

      teams.each do |team|
        panel team.name + ", Team Leader:" + team.team_leader_name + ", Score:" + team.score.to_s do
          table_for User.where(team_id: team.id).each do |user|
            column(:name)
            column(:email)
            column(:score) {|user| link_to(user.score, admin_user_path(user)) }
          end
        end
      end
    end

  end # columns

    # render html: "<div class='progress'><div class='progress-bar' role='progressbar' style='width: 25%;' aria-valuenow='25' aria-valuemax='100' aria-valuemin='0'>25%</div></div>".html_safe

    # render html: "<%= progress_bar(53, :color => 'blue', :rounded =>true) %>".html_safe
    # progress_bar(53, :color => 'blue', :rounded =>true)
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  # end # content
end
