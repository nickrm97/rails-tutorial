class ArticlesController < ApplicationController
    def new
        puts "-------------------------------------"
        puts "NEW (Method activated)"
        puts "-------------------------------------"
    end

    def index
        @articles = Article.all
    end

    def create
        puts "-------------------------------------"
        puts "CREATE (Method activated)"
        puts "-------------------------------------"
        # byebug
        @article = Article.new(article_params)
        @article.save

        redirect_to @article
    end

    def show
        @article = Article.find(params[:id])
        puts "-------------------------------------"
        puts "Hey my peeps what's going on"
        puts "-------------------------------------"
    end

    private
        def article_params 
            params.require(:article).permit(:title, :text)
        end
end
