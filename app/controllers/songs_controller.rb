class SongsController < ApplicationController
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
	def show
		@song = Song.find(params[:id])
	end
	private
	def song_params
		params.require(:song).permit(:name,:link,:user)
	end


end
