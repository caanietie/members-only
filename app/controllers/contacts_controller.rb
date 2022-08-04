class ContactsController < ApplicationController
  before_action :authenticate_user!, only: %i[index destroy]
  before_action :check_contacts_perms

  def index
    @contact = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new contact_params
    if @contact.save
      flash[:notice] = "Message sent. Thanks for contacting us."
      redirect_to posts_path
    else
      flash.now[:alert] = "Message was not sent due to an error."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find_by id: params[:id]
    if @contact.destroy
      flash[:notice] = "Successfully deleted message."
      redirect_to contacts_path
    else
      flash.now[:alert] = "Unable to delete message."
      render :index, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit %i[name message]
  end

  def check_contacts_perms
    if params[:action].in? %w[index destroy] and current_user.id != 1
      flash[:alert] = "You are not authorized to view the resource."
      redirect_to new_contact_path
    end
  end
end
