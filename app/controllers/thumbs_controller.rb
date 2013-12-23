class ThumbsController < ApplicationController
  before_action :get_row
  before_action :get_thumb, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    if @thumb.update(thumb_params)
      redirect_to [@row, @thumb]
    else
      render 'edit'
    end
  end

  def new
    @thumb = @row.thumbs.new
  end

  def create
    @thumb = @row.thumbs.new(thumb_params)
    if @thumb.save
      redirect_to @row
    else
      render 'edit'
    end
  end

  def destroy
    @thumb.destroy
    redirect_to row_path(@row)
  end

  private

    def get_row
      @row = Row.find(params[:row_id])
    end

    def get_thumb
      @thumb = @row.thumbs.find(params[:id])
    end

    def thumb_params
      params.require(:thumb).permit(:label, :image_path, :active)
    end
end
