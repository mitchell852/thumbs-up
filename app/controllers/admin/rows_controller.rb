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
    if @row.save
      redirect_to admin_rows_path
    else
      redirect_to new_admin_row_path
    end
  end

  def edit
  end

  def update
    if @row.update(row_params)
      redirect_to [:admin, @row]
    else
      redirect_to edit_admin_row_path(@row)
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
