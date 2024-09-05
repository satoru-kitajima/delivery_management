class RequestsController < ApplicationController
  before_action :set_request, only: [:edit, :update, :destroy]

  def index
    @requests = Request.all.order(created_at: :desc)
  end

  def new
    @request = Request.new
    @request.build_package
  end

  def create
    @request = Request.new(request_params)
    @request.user_id = @current_user.id 

    if handle_request(@request, new_request_path)
      flash[:notice] =  "配送依頼が作成されました"
      redirect_to requests_path
    end
  end

  def edit
  end

  def update
    @request.assign_attributes(request_params)
    @request.user_id = @current_user.id 

    if handle_request(@request, edit_request_path(@request))
      flash[:notice] = "配送依頼が更新されました"
      redirect_to requests_path
    end
  end
  
  def destroy
      if @request
          @request.destroy
          redirect_to requests_path, notice: '配送依頼が削除されました'
        else
          redirect_to requests_path, alert: 'Request not found.'
        end
  end

  private
  def set_request
    @request = Request.find_by(id: params[:id])
  end

  def set_status(request)
    if request.pickup_required || request.delivery_required
      request.status = 1
    else
      request.status = 2
    end
  end

  def handle_error(message, redirect_path)
    flash[:alert] = message
    redirect_to redirect_path
  end

  def handle_request(request, redirect_path)
    logger.debug "Request attributes before save: #{request.inspect}"

    unless request.package&.valid?
      handle_error("荷物情報に誤りがあります", redirect_path) and return false
    end

    if request.train.nil? || request.train.cargo.nil?
      handle_error("希望便または荷物情報が見つかりません。", redirect_path) and return false
    end

    if request.exceeds_cargo_capacity?
      handle_error("キャパシティを超えています。別の日付か運行便を選択してください。", redirect_path) and return false
    end

    set_status(@request)

    if request.save
      logger.debug "Request saved successfully: #{request.inspect}"
      return true
    else
      logger.debug "Request save failed: #{request.errors.full_messages}"
      handle_error("入力項目に誤りがあります", redirect_path)
      return false
    end
  end

  def request_params
    params.require(:request).permit(:delivery_date, :trains_id, :pickup_required, :delivery_required, :pickup_id, :dropoff_id, :status, package_attributes: [:size, :quantity, :item_id, :id])
  end
end