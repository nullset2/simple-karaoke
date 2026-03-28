class RequestsController < ApplicationController
  before_action :set_request, only: %i[ show edit update destroy ]
  def index
    @requests = Request.all
  end

  def show
  end

  def new
    @request = Request.new
  end

  def edit
  end

  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_back_or_to '/', notice: "Request for #{request_params[:song_name]} was successfully created." }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: "Request was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @request.destroy!

    respond_to do |format|
      format.html { redirect_to requests_path, notice: "Request was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    def set_request
      @request = Request.find(params.expect(:id))
    end

    def request_params
      params.expect(request: [ :song_name, :user_id])
    end
end
