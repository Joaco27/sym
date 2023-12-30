class AccessesController < ApplicationController

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


end
