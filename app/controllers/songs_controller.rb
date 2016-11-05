class SongsController < ApplicationController
	before_action :set_song, :only => [ :show, :edit, :update, :destroy ]
	def index
		@songs = Song.all
	end

	def new 
		@song = Song.new
	end

	def create
		@song = Song.new(song_params)
		@song.save
		redirect_to :action => :index
	end

	def update
		@song.update(song_params)
		redirect_to :action => :index
	end

	def destroy
		@song.destroy
		redirect_to :action => :index
	end
		
	private

	def set_song
		@song = Song.find(params[:id])
	end

	def song_params
		params.require(:song).permit(:name,:link,:user)
	end


end
