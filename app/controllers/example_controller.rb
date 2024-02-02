class ExampleController < ApplicationController
  def index
  end

  def show
    @example = Example.list.select { |ex| ex.slug == params[:slug] }.first
  end
end
