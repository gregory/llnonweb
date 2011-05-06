class EstatesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  respond_to :html, :xml, :json
  # GET /estates
  # GET /estates.xml
  def index
    @estates = Estate.all
    @json = @estates.to_gmaps4rails
    respond_with(@estates)
    
  end
  
  # GET /estates/1
  # GET /estates/1.xml
  def show
    @estate = Estate.find(params[:id])
     @json = @estate.to_gmaps4rails
    respond_with(@estate)
   
  end

  # GET /estates/new
  # GET /estates/new.xml
  def new
    respond_with(@estate = Estate.new)
  end

  # GET /estates/1/edit
  def edit
    @estate = Estate.find(params[:id])
  end

  # POST /estates
  # POST /estates.xml
  def create
    @estate = Estate.new(params[:estate])
    @estate.user_id = current_user.id
    if @estate.save
      respond_with(@estate,:notice => "Successfully created page.", :location => @estate, :status => :created)
    else
      respond_to do |format|
        format.html { render :action => "new" }
        format.xml  { render :xml => @estate.errors, :status => :unprocessable_entity }
        format.json { render :xml => @estate.errors}
      end
    end
  end

  # PUT /estates/1
  # PUT /estates/1.xml
  def update
    @estate = Estate.find(params[:id])
    @estate.user_id = current_user.id
    if @estate.save
      respond_with(@estate,:notice => "Estate was successfully updated.", :location => @estate, :status => :created)
    else
      respond_to do |format|
        format.html { render :action => "edit" }
        format.xml  { render :xml => @estate.errors, :status => :unprocessable_entity }
        format.json { render :xml => @estate.errors}
      end
    end
  end

  # DELETE /estates/1
  # DELETE /estates/1.xml
  def destroy
    @estate = Estate.find(params[:id])
    @estate.destroy
    
    respond_to do |format|
      format.html { redirect_to(estates_url) }
      format.xml  { head :ok }
    end
  end
end
