class SongsController < ApplicationController
	before_action :set_song, :only => [ :show, :edit, :update, :destroy ]
	def index
		if params[:id]
			@song = Song.find(params[:id])
		else
			@song = Song.new
		end
		@songs = Song.page(params[:page]).per(5)
		
	end

	def new 
		@song = Song.new
	end

	def create
		@song = Song.new(song_params)
		if @song.save
			flash[:notice] = "新增成功"
			redirect_to  songs_path(:page=>params[:page])
		else
			@songs = Song.page(params[:page]).per(5)
			flash[:alert] = "新增失敗"
			render :action => :index
		end
	end

	def update
		if @song.update(song_params)
			flash[:notice] = "修改成功"
			redirect_to  songs_path(:page=>params[:page])
		else
			render :action => :edit
		end
	end
	
	def destroy
		@song.destroy
		flash[:notice] = "刪除成功"
		redirect_to songs_path(:page=>params[:page])
	end
		
	private

	def set_song
		@song = Song.find(params[:id])
	end

	def song_params
		params.require(:song).permit(:name,:link,:user)
	end


end
