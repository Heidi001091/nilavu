module Sources
  module Runningbooks
    class Usermodel < Sources::Runningbooks::Base
      def get(options = {})
        widget  = Widget.find(options[:wid].to_i)
        dashboard_id = widget.dashboard_id
        #dashboard = Dashboard.find(dashboard_id)
        dashboard = App.find(dashboard_id)
        user_id = dashboard.users_id
        r = (AppsHistory.where(:book_id => App.where(:id => dashboard_id)).where(:status => 'created').count).to_f
        t = (App.where(:users_id => user_id).count).to_f
        if t == 0.0
        a = 0.0
        else
        a = ((r/t)*100.0).to_f.round(2)
        end
        { :value => r, :average => a }
      end

    end

  end
end
