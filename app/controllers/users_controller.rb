class UsersController < ApplicationController

	def index 
		@users = User.all  
        # render index view file (it will have access to instance variables)
    	render :index
	end	

	def new
		@user = User.new 
        render :new 
    end

    def create
        # validate params and save them as a variable
        user_params = params.require(:user).permit(:name, :email, :password)
        # create a new creature with those params
        user = User.new(user_params)
        # check that it saved
        if user.save
            # if saved, redirect to route that shows all creatures
            redirect_to user
            # ^ same as redirect_to "/creatures"
        end
    end

    def show
        # get the id parameter from the url
        id = params[:id]
        # find the creature with that id and save to an instance variable
        @user = User.find(id)
        # render the show page -- it will have access to the @creature variable
        render :show
    end

    def edit
        # save the id parameter to a variable
        id = params[:id]
        # look up the creature by id and save to an instance variable
        @user = User.find(id)
        # render the edit form view -- it will have access to the @creature instance variable
        render :edit
    end

    def update
        # save the id paramater from the url
        user_id = params[:id]
        # find the creature to update by id
        user = User.find(user_id)

        # get updated creature data from params
        updated_attributes = params.require(:user).permit(:name, :email, :password)
        # update the creature
        user.update_attributes(updated_attributes)

        # redirect to single creature show page for this creature
        redirect_to user
        # ^ same as redirect_to creature_path(creature)
        # ^ same as redirect_to "/creatures/#{creature.id}"
    end

    def destroy
        # save the id parameter
        id = params[:id]
        # find the creature to delete by id
        user = User.find(id)
        # destroy the creature
        user.destroy
        # redirect to creatures index
        redirect_to users_path
        # ^ same as redirect_to "/users"
    end

end
