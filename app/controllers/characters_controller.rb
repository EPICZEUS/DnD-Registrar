class CharactersController < ApplicationController
	before_action :find_character, only: [:show, :edit, :update, :destroy]

	def index
		@characters = Character.all
	end

	def show
	end

	def new
		@character = Character.new
	end

	def create
		@character = Character.new(character_params)

		if @character.save
			redirect_to @character
		else
			flash[:errors] = @character.errors.full_messages
			redirect_to new_character_path
		end
	end

	def edit
		
	end

	def update
		if @character.update(character_params)
			redirect_to @character
		else
			flash[:errors] = @character.errors.full_messages
			redirect_to edit_character_path
		end
	end

	def destroy
		@character.destroy
		redirect_to characters_path
	end

	private

	def find_character
		@character = Character.find(params[:id])
	end

	def character_params
		params.require(:character).permit(:name, :user_id, :campaign_id)
	end
end
