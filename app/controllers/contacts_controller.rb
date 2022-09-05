class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end


  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = 'Contato criado com sucesso.'
      redirect_to root_path
    else
      render :new
    end
  end

    private

  def contact_params
    params.require(:contact).permit(:full_name, :cpf, :email, :birth_date)
  end
end
