class CampaignsController < ApplicationController
	before_action :find_campaign, only: [:show, :edit, :update, :destroy]

	def index
		@campaigns = Campaign.all
	end

	def show
	end

	def new
		@campaign = Campaign.new
	end

	def create
		@campaign = Campaign.new(campaign_params)

		if @campaign.save
			redirect_to @campaign
		else
			flash[:errors] = @campaign.errors.full_messages
			redirect_to new_campaign_path
		end
	end

	def edit
		
	end

	def update
		if @campaign.update(campaign_params)
			redirect_to @campaign
		else
			flash[:errors] = @campaign.errors.full_messages
			redirect_to edit_campaign_path
		end
	end

	def destroy
		@campaign.destroy
		redirect_to campaigns_path
	end

	private

	def find_campaign
		@campaign = Campaign.find(params[:id])
	end

	def campaign_params
		params.require(:campaign).permit(:name, :user_id)
	end
end
