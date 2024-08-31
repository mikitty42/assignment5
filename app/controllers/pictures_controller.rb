class PicturesController < ApplicationController
  def index
      @pictures = Picture.all
  end

  def new
      @picture = Picture.new
  end
  
  def create
      @picture = Picture.new(picture_params)
      if @picture.save
          redirect_to pictures_path
      else
          render :new, status: :unprocessable_entity
      end
  end
              
  end

  def edit
  end

  def show
  end
  
  
  private
  
  def picture
      params.require(:picture).permit(:content,:image)
  end
end
