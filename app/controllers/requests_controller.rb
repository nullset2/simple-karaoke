class RequestsController < ApplicationController
  before_action :authenticate_admin, only: %i[ edit update destroy admin rank_up rank_down ]
  before_action :set_request, only: %i[ show edit update destroy rank_up rank_down ]

  def index
    @requests = Request.order(:rank).first(4)
  end

  def admin
    @requests = Request.all.order(:rank)
  end

  def show
  end

  def new
    @request = Request.new
  end

  def edit
  end

  def rank_up
    tmp = @request.rank
    up = Request.find_by(rank: tmp - 1)
    @request.update!(rank: up.rank)
    up.update!(rank: tmp)
    redirect_back_or_to admin_path, notice: "Ranked up."
  end

  def rank_down
    tmp = @request.rank
    down = Request.find_by(rank: tmp + 1)
    @request.update!(rank: down.rank)
    down.update!(rank: tmp)
    redirect_back_or_to admin_path, notice: "Ranked down."
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
      format.html { redirect_back_or_to requests_path, notice: "Request was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    def authenticate_admin
      unless current_or_guest_user.admin?
        flash[:error] = "You must be an admin to access this section"
        redirect_to "/"
      end
    end

    def set_request
      @request = Request.find(params.expect(:id))
    end

    def request_params
      params.expect(request: [ :song_name, :user_id])
    end
end
