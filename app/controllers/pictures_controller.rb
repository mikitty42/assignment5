class PicturesController < ApplicationController
  def index
      @pictures = Picture.all
  end

  def new
      @picture = Picture.new
  end
  
  def create
      @picture = current_user.pictures.build(picture_params)
      if params[:back]
          render :new, status: :unprocessable_entity
      else
          if @picture.save
              redirect_to pictures_path,notice: 'Pictureを投稿しました'
          else
              render :new, status: :unprocessable_entity
          end
      end
  end
              

  def edit
      @picture = Picture.find(params[:id])
  end

  def update
      @picture = Picture.find(params[:id])
      if @picture.update(picture_params)
          redirect_to pictures_path,notice: 'Pictureを編集しました'
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
     redirect_to pictures_path,notice: 'Pictureを削除しました'
 end

 def confirm
     @picture = current_user.pictures.build(picture_params)
     render :new if @picture.invalid?
 end
  
  
  private
  
  def picture_params
      params.require(:picture).permit(:content,:image,:image_cache)
  end
end
