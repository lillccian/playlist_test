class SongsController < ApplicationController
	before_action :set_song, :only => [ :show, :edit, :update, :destroy ]
	def index
		@songs = Song.page(params[:page]).per(10)
	end

	def new 
		@song = Song.new
	end

	def create
		@song = Song.new(song_params)
		if @song.save
			flash[:notice] = "新增成功"
			redirect_to :action => :index
		else
			render :action => :new
		end
	end

	def update
		if @song.update(song_params)
			flash[:notice] = "修改成功"
			redirect_to :action => :index
		else
			render :action => :edit
		end
	end

	def destroy
		@song.destroy
		flash[:notice] = "刪除成功"
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
