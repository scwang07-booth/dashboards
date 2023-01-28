class ApplicationController < ActionController::Base

  def dashboards
    render(:template=>"dashboard_templates/main.html.erb")
  end
end
