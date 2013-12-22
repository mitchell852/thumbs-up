class RowsController < ApplicationController
  before_action :set_row, only: [:show, :destroy]

  def index
    @rows = Row.all
  end

  def show
  end

  def create
    @row = Row.new(params[:row])
    @row.save
    redirect_to rows_path
  end

  def destroy
    @row.destroy
    redirect_to rows_path
  end

  private

    def set_row
      @row = Row.find(params[:id])
    end
end
