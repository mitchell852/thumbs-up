class Admin::RowsController < ApplicationController
  before_action :get_row, only: [:show, :edit, :update, :destroy]

  def index
    @rows = Row.all
  end

  def show
  end

  def new
    @row = Row.new
  end

  def create
    @row = Row.new(row_params)
    @row.save
    redirect_to admin_rows_path
  end

  def edit
  end

  def update
    if @row.update(row_params)
      redirect_to [:admin, @row]
    else
      render 'edit'
    end
  end

  def destroy
    @row.destroy
    redirect_to admin_rows_path
  end

  private

    def get_row
      @row = Row.find(params[:id])
    end

    def row_params
      params.require(:row).permit(:title, :description, :link_url)
    end
end
