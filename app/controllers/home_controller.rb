class HomeController < ApplicationController
    def index
        @article = Article.first
        @title = "デイトラ"
        render 'home/index'
    end

    def about
        render 'home/about'
    end
end
