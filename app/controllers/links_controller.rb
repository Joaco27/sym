class LinksController < ApplicationController
  before_action :set_link, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /links or /links.json
  def index
    @links = current_user.links
  end

  # GET /links/1 or /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = current_user.links.build
  end
  # GET /links/1/edit
  def edit
  end

  # POST /links or /links.json
  def create
    # puts "Paramteros recibidos: #{link_params}"

    @link = current_user.links.build(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to links_url, notice: "Link was successfully created." }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1 or /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to links_url, notice: "Link was successfully updated." }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1 or /links/1.json
  def destroy
    @link.destroy!

    respond_to do |format|
      format.html { redirect_to links_url, notice: "Link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def redirect
    puts redirect_params
    @link = Link.where(:slug => redirect_params[:slug]).first

    if @link.present?
      if @link.is_accesable?
        if @link.category == "Privado"
          return redirect_to "/input_password/#{@link.id}"
        end
        @link.accesses.create(:ip => request.remote_ip)
        return redirect_to @link.original_link, allow_other_host: true
      end
    end
    return render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false
  end

  def input_password
  end

  def verify_password
    @link = Link.find(params[:id])

    if @link.password == params[:password]
      @link.accesses.create(:ip => request.remote_ip)
      return redirect_to @link.original_link, allow_other_host: true
    else
      return redirect_to "/input_password/#{@link.id}"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def link_params
      params.require(:link).permit(:original_link, :category, :password, :expiration)
    end

    def redirect_params
      params.permit(:slug)
    end

end
