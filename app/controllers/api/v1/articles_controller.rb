class Api::V1::ArticlesController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :basic_auth

  # acá van todas las acciones



  def index
    articles = Article.all
    render json: articles
  end



def create
  article = Article.new(article_params)
  if article.save
    render json: article, status: :ok
  else
    render json: {errors: article.errors}, status: 422
  end

end


def destroy
  article = Article.find(params[:id])
   article.destroy
   render json: {message: "Article deleted"}, status: 200
end


private
  def basic_auth
    authenticate_or_request_with_http_basic do |user, password|
      # Verificar user y password. Por ejemplo (aunque no lo recomendamos):
      user == "german" && password == "test1234"
    end
  end

  def article_params
      params.require(:article).permit(:title, :body, :published)
  end




end
