class AccessesController < ApplicationController
  before_action :authenticate_user!, only: %i[ index filtered_accesses search_by_dates ]
  before_action :check_owner, only: %i[ index filtered_accesses search_by_dates ]

  def index
    @accesses = Link.find(params[:format]).accesses
    @link_id = params[:format]
  end

  def filtered_accesses
    @accesses = Link.find(params[:format]).accesses
    if params[:filter_type] == "Por Ip"
      @filtered_accesses = @accesses.where("ip LIKE ?", "%#{params[:ip]}%")
    else
      search_by_dates(params[:fecha_inicio], params[:fecha_fin])
    end
  end

  def search_by_dates(fecha_inicio, fecha_fin)
    fecha_fin = fecha_fin.to_date
    fecha_inicio = fecha_inicio.to_date
    if fecha_inicio.present? && fecha_fin.present?
      @filtered_accesses = @accesses.where(created_at: fecha_inicio..fecha_fin.end_of_day)
    elsif fecha_inicio.present? && fecha_fin.blank?
      @filtered_accesses = @accesses.where('created_at >= ?', fecha_inicio)
    elsif fecha_fin.present? && fecha_inicio.blank?
      @filtered_accesses = @accesses.where('created_at <= ?', fecha_fin.end_of_day)
    else
      @filtered_accesses = @accesses.all
    end

    @filtered_accesses
  end

  private
    def check_owner
      @link = Link.find(params[:format])
      if @link.user_id != current_user.id
        return render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false
      end
    end

end
