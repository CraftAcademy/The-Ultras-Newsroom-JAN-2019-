class ArticlesController < ApplicationController
    protect_from_forgery
    before_action :check_subscriber, only: [:show]
    before_action :authenticate_user!, only: [:create, :new]
    
    def index
        @categories = Category.all
        if params[:category].present?
            @articles = Category.find_by(name: params[:category]).articles.approved
        else
            @articles = Article.approved
        end
    end

    def show
        @article = Article.find(params[:id])
    end
       
    private

    def check_subscriber
        if Article.find(params[:id]).premium? == true 
            if user_signed_in? && current_user.subscriber?
                true
            else
                redirect_to root_path, notice: 'To read this premium article, you need to become a subscriber.'
            end
        else
            true
        end    
    end

    def article_params
        params.require(:article).permit(:title, :content, :lead, :image)
    end     
end