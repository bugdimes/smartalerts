class AlertsController < ApplicationController
  def create
    @alert = Alert.new(transform_params(alert_params))

    if @alert.save
      render json: @alert, status: :created
    else
      render json: @alert.errors, status: :unprocessable_entity
    end
  end

  private
    def alert_params
      params.permit(:RecordType, :MessageStream, :Type, :TypeCode, :Name, :Tag, :Description, :Email, :From, :BouncedAt)
    end

    def transform_params(params)
      {
        record_type: params[:RecordType],
        message_stream: params[:MessageStream],
        alert_type: params[:Type],
        type_code: params[:TypeCode],
        name: params[:Name],
        tag: params[:Tag],
        description: params[:Description],
        email: params[:Email],
        from: params[:From],
        bounced_at: params[:BouncedAt]
      }
    end
end
