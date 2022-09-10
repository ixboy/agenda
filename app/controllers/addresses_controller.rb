class AddressesController < ApplicationController
  before_action :require_logged_in_user
  before_action :use_unsafe_params, only: [:fetch_cep]

  def params
    @_dangerous_params || super
  end

  def new
    session[:contact] = Contact.find_by(id: params[:contact_id])
  end

  def fetch_cep
    cep = params[:cep]
    data = CepApi.new(cep)
    address_info = data.call
    render json: address_info
  end

  def edit
    @contact = session[:contact]
    @address = current_user.contacts.find_by(id: @contact['id']).address
    if @address.nil?
      flash[:danger] = 'Endereço não encontrado.'
      redirect_to root_path
    end
  end

  def create
    @contact = session[:contact]
    @address = Address.create(address_params)
    @address.contact_id = @contact['id']
    if @address.save
      flash[:success] = 'Endereço cadastrado com sucesso.'
      redirect_to contact_path(@contact['id'])
    else
      render :new
    end
  end

  def update
    @contact = session[:contact]
    @address = current_user.contacts.find_by(id: @contact['id']).address
    if @address.update(address_params)
      flash[:success] = 'Endereço atualizado com sucesso'
      redirect_to contact_path(@contact['id'])
    else
      render 'edit'
    end
  end

  private

  def address_params
    params.require(:address).permit(:cep, :street, :number, :district, :city, :state, :contact_id)
  end

  def use_unsafe_params
    @_dangerous_params = request.parameters
  end
end
