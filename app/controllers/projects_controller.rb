class ProjectsController < ApplicationController
  before_action :authenticate_user!
  def index
    @sort_option = params[:sort_option] || "recent"
    @sort_type = params[:sort_type] || "ASC"
    order_clause = order_by(@sort_option, @sort_type)

    @projects = Project
                  .joins(:user)
                  .left_joins(:category)
                  .select("projects.*, users.username, categories.name AS category_name")
                  .order(order_clause)
                  .page(params[:page])

  respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  private

  def order_by(option, direction)
    case option
    when "category"
      "categories.name #{direction}"
    when "username"
      "users.username #{direction}"
    when "title"
      "projects.title #{direction}"
    else
      "projects.created_at #{direction}"
    end
  end
end
