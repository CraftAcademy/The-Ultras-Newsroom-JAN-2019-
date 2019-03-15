class ArticlesController < ApplicationController
    protect_from_forgery
    before_action :check_journalist, only: [:create, :new]
    def index
        @articles = Article.all
    end

    def new
        
    end

    def show
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)
       
        @article.save
        redirect_to new_article_path, notice: 'Article was successfully created.'
    end
       
    private

    def check_journalist
        current_user.journalist?
    end

    def article_params
        params.require(:article).permit(:title, :content, :lead)
    end     
end
