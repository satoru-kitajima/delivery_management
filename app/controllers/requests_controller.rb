class RequestsController < ApplicationController
    def index
      @requests = Request.all.order(created_at: :desc)
    end
  
    def show
      @request = Request.find_by(id: params[:id])
      @request = @request.package
      
    end
  
    def new
      @request = Request.new
      @request.build_package
    end
  
    def create
        @request = Request.new(request_params)
        # current_userのuser_idをセット
        @request.user_id = @current_user.id 

        # Packageのバリデーションチェック
        unless @request.package&.valid?
          flash[:alert] = "荷物情報に誤りがあります"
          redirect_to new_request_path and return
        end

        # trainとcargoが存在するか確認
        if @request.train.nil? || @request.train.cargo.nil?
          flash[:alert] = "希望便または荷物情報が見つかりません。"
          redirect_to new_request_path and return
        end

        # ステータスの自動設定
        if @request.pickup_required || @request.delivery_required
          @request.status = 1
        else
          @request.status = 2
        end

        # キャパシティチェック
        if exceeds_cargo_capacity?(@request)
          flash[:alert] = "キャパシティを超えています。別の日付か運行便を選択してください。"
          redirect_to new_request_path and return
        end

      if @request.save
        redirect_to requests_path
        flash[:notice] = "配送依頼が作成されました"
      else
        flash[:alert] = "入力項目に誤りがあります"
        redirect_to new_request_path and return
      end
    end

    def edit
        @request = Request.find_by(id: params[:id])
    end

    def update
      @request = Request.find_by(id: params[:id])
    
      if @request.nil?
        flash[:alert] = "配送依頼が見つかりません。"
        redirect_to requests_path and return
      end
    
      # リクエストの属性を更新
      if @request.update(request_params)
        # キャパシティチェック
        if exceeds_cargo_capacity?(@request)
          flash[:alert] = "キャパシティを超えています。別の日付か運行便を選択してください。"
          render :edit and return
        end
    
        flash[:notice] = "配送依頼が更新されました"
        redirect_to requests_path
      else
        flash.now[:alert] = "入力項目に誤りがあります"
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
      params.require(:request).permit(:delivery_date, :trains_id, :pickup_required, :delivery_required, :pickup_id, :dropoff_id, :status, package_attributes: [:size, :quantity, :item_id])
    end

    def exceeds_cargo_capacity?(request)
      # 新規リクエストに紐づくパッケージのサイズと数量を計算
      new_package_volume = request.package.size * 0.01 * request.package.quantity
  
      # 既存の同日、同cargo_idに紐づくリクエストのパッケージ量を取得
      total_volume = Request.total_package_volume(request.train.cargo_id, request.delivery_date)
  
      # 新しいリクエストのパッケージ量を加算して、キャパシティを超えているか確認
      total_volume + new_package_volume > request.train.cargo.capacity
    end
    

  end
  
  