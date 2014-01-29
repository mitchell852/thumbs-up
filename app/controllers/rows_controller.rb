class RowsController < ApplicationController
  def index
    @rows = Row.all
  end
end
