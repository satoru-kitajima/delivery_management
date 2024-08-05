class RequestsController < ApplicationController
    def index
      @requests = Request.all.order(created_at: :desc)
    end
  
    def show
      @request = Request.find_by(id: params[:id])
    end
  
    def new
      @request = Request.new
      @request.packages.build
    end
  
    def create
        @request = Request.new(request_params)
        if @request.save
            redirect_to requests_path
            flash[:notice] = "配送依頼が作成されました"
        else
            render :new
        end
    end

    def edit
        @request = Request.find_by(id: params[:id])
    end

    def update
        @request = Request.find_by(id: params[:id])
        if @request.update(request_params)
            redirect_to requests_path
            flash[:notice] = "配送依頼が更新されました"
        else
            render :edit
        end
    end

    def destroy
        @request = Request.find_by(id: params[:id])
        if @request
            @request.destroy
            redirect_to requests_path, notice: '配送依頼が削除されました'
          else
            redirect_to requests_path, alert: 'Request not found.'
          end
    end

    private
  
    def request_params
      params.require(:request).permit(:delivery_date, :preferred_shipment, :pickup_required, :delivery_required, packages_attributes: [:size])
    end

  end
  
  