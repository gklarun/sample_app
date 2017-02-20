class ClubsController < ApplicationController
	before_action :get_club, only: [:show, :edit, :update, :destroy]
	before_action :has_permission? , only: [:edit, :update, :destroy]
	def create
		@club = Club.new(club_params)
		@club.user = current_user
		respond_to do |format|
			if @club.save

				format.html { redirect_to club_path @club}
				format.json { head :no_content }
			else
				format.html { render action: 'new' }
				format.json { render json: @club.errors, status: :unprocessable_entity }
			end
		end
	end

	def new
		@club = Club.new
	end

	def edit
	end

	def delete
		if @club.destroy
			respond_to do |format|
				flash[:success] = "succesfully deleted"
				format.html { redirect_to static_pages_home_url }
				format.json { head :no_content }
			end
		else
			respond_to do |format|
				flash[:error] = " something went wrong "
				format.html { render action: 'show'}
				format.json { head :no_content }
			end
		end
end

	def update
		respond_to do |format|
			if @club.update(club_params)
				format.html { redirect_to @club, notice: 'Club was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def show
		get_club
	end

	def index
		@clubs = Club.all
	end

		private

	def get_club
		@club = Club.find(params[:id])
	end

	def club_params
		params.require(:club).permit(:name)
	end

	def has_permission?
		if @club.user != current_user
			respond_to do |format|
				flash[:error] = " You dont have permission "
				format.html { render action: 'show'}
				format.json { head :no_content }
			end
		end
	end
end
