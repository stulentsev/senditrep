class DeliveriesController < ApplicationController
  http_basic_authenticate_with name: ENV["EDIT_NAME"], password: ENV["EDIT_PASSWORD"]
  # GET /deliveries
  # GET /deliveries.json
  def index
    @deliveries = Delivery.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @deliveries }
    end
  end

  # GET /deliveries/1
  # GET /deliveries/1.json
  def show
    @delivery = Delivery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @delivery }
    end
  end

  # GET /deliveries/new
  # GET /deliveries/new.json
  def new
    @delivery = Delivery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @delivery }
    end
  end

  # GET /deliveries/1/edit
  def edit
    @delivery = Delivery.find(params[:id])
  end

  # POST /deliveries
  # POST /deliveries.json
  def create
    @delivery = Delivery.new(delivery_params)

    respond_to do |format|
      if @delivery.save
        format.html { redirect_to @delivery, :notice => 'Delivery was successfully created.' }
        format.json { render :json => @delivery, :status => :created, :location => @delivery }
      else
        format.html { render :action => "new" }
        format.json { render :json => @delivery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /deliveries/1
  # PUT /deliveries/1.json
  def update
    @delivery = Delivery.find(params[:id])

    respond_to do |format|
      if @delivery.update_attributes(delivery_params)
        format.html { redirect_to @delivery, :notice => 'Delivery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @delivery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /deliveries/1
  # DELETE /deliveries/1.json
  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy

    respond_to do |format|
      format.html { redirect_to deliveries_url }
      format.json { head :no_content }
    end
  end

  private

    def delivery_params
      params.require(:delivery).permit(:name, :website, :extra1, :extra2, :extra3,:image_url)
    end
end
