class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end
    
    def create
        puts "-------------------------------------"
        puts "CREATE (Method activated)"
        puts "-------------------------------------"
        # byebug
        @article = Article.new(article_params)

        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
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
