class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  respond_to :html, :xml, :json, :rss, :atom
  def index
    respond_with(@pages = Page.all) 
  end

  def show
    respond_with(@page = Page.find(params[:id].to_i))
  end

  def new
    @page = Page.new
    respond_with(@page)
  end

  def create
    @page = Page.new(params[:page].to_i)
    @page.slug = @page.title.to_url
    if @page.save
      respond_with(@page,:notice => "Successfully created page.", :location => @page, :status => :created)
    else
      respond_to do |format|
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @page = Page.find(params[:id].to_i)
  end

  def update
    @page = Page.find(params[:id].to_i)
    @page.slug = @page.title.to_url
    if @page.update_attributes(params[:page])
      respond_with(@page,:notice => "Successfully updated page.", :location => @page, :status => :created) 
    else
      respond_to do |format|
        format.html { render :action => "edit" }
        format.xml  { render :xml => @test.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @page = Page.find(params[:id].to_i).destroy
    redirect_to pages_url, :notice => "Successfully destroyed page."
  end
end
