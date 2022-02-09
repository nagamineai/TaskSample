class TaskController < ApplicationController
    def index
    end
    
    def new
    end
    
    def create
        redirect_to tasks_url
    end
end
