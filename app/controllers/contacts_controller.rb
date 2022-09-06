class ContactsController < ApplicationController
  def index
    @contacts = Contact.search(params[:search])
  end

  def show
    @contact = Contact.find_by(id: params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      flash[:success] = 'Contato criado com sucesso.'
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @contact = current_user.contacts.find_by(id: params[:id])
    if @contact.nil?
      flash[:danger] = 'Contato não encontrado.'
      redirect_to root_path
    end
  end

  def update
    @contact = current_user.contacts.find(params[:id])
    if @contact.update(contact_params)
      flash[:success] = 'Contato atualizado com sucesso'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @contact = current_user.contacts.find(params[:id])
    if @contact.destroy
      flash[:success] = 'Contato removido com sucesso'
      redirect_to root_path
    else
      flash[:danger] = 'Contato não encontrado.'
      redirect_to root_path
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :cpf, :email, :birth_date)
  end
end
