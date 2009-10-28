class ContactsController < ApplicationController
  MIN_ADDRESSES = 3
 
  def index
    @contacts = Contact.all(:limit=>10)
  end

  def new
    @contact = Contact.new
    MIN_ADDRESSES.times do
        @contact.addresses.build
    end
  end
  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      flash[:notice] = "Todo genial! #{@contact.first_name} salvado"
      redirect_to contacts_path
    else
      (MIN_ADDRESSES - @contact.addresses.length).times do
        @contact.addresses.build
      end
      render :action => 'new'
    end
  end
  
  def edit
    @contact = Contact.find(params[:id])
    @contact.addresses.build
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      flash[:notice] = "Todo genial! #{@contact.first_name} actualizado"
      redirect_to contacts_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path
  end
    
  def shared
  #    if @contact.nil?
  #      @contact = Contact.find_by_signature(params[:contact_id] || params[:id])
  #    end
  #   Lo anterior equivale a lo siguiente:
  #
    @contact ||= Contact.find_by_signature(params[:contact_id] || params[:id])
  end

end
