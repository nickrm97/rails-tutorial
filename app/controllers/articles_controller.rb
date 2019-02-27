class ArticlesController < ApplicationController
    def new 
        # don't think this is possible until we have a model in
        # @article = Article.new
    end

    def create
        @article = Article.new(article_params)

        if @article.save 
            puts "All good in the hood"
            redirect_to @article
        else 
            puts "ERROR: Cannot save!"
        end
    end

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
        # render plain: @article.title
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])

        # If it updates, getting the params from the func. prev defined
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end 

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end
    
    private
    def article_params
        params.require(:article).permit(:title, :text)
    end
end
