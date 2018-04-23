class Api::V1::ArticlesController < ApplicationController
  def index
    articles = Articles.all
    render json: articles
  end
end
