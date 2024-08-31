class PicturesController < ApplicationController
  def index
      @pictures = Picture.all
  end

  def new
      @picture = Picture.new
  end
  
  def create
      @picture = Picture.new(picture_params)
      if params[:back]
          render :new, status: :unprocessable_entity
      else
          if @picture.save
              redirect_to pictures_path
          else
              render :new, status: :unprocessable_entity
          end
      end
  end
              
  end

  def edit
      @picture = Picture.find(params[:id])
  end

  def update
      @picture = Picture.find(params[:id])
      if @picture.update(picture_params)
          redirect_to pictures_path
      else
          render :edit, status: :unprocessable_entity
      end
  end
      

  def show
      @picture = Picture.find(params[:id])
  end

 def destroy
     @picture = Picture.find(params[:id])
     @picture.destroy
     redirect_to pictures_path
 end

 def confirm
     @picture = Picture.new(picture_params)
     render :new if @picture.invalid?
 end
  
  
  private
  
  def picture
      params.require(:picture).permit(:content,:image)
  end
end
