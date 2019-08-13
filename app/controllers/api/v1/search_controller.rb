# Class for app search profiles
class SearchController < ApplicationController
  def index
    q = User.ransack
    results = q.result.select('*')
    .joins(:user_profile)
    .page(params[:page])
    render_success(results: results)
  end
end