class ContactsController < ApplicationController
  
  def index
    @contacts = Contact.all(:limit=>10)
  end

  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      flash[:notice] = "Todo genial! #{@contact.first_name} salvado"
      redirect_to contacts_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @contact = Contact.find(params[:id])
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
    
    

end
