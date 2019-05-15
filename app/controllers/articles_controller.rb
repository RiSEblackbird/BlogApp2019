class ArticlesController < ApplicationController
  before_action :login_required, except: [:index, :show]

  def index
    @articles = Article.order(released_at: :desc)
  end
  
end
