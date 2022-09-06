class AddressesController < ApplicationController
  
  before_action :set_contact
  before_action :set_address, only: %i[edit update destroy]
  
  def new
    @address = @contact.addresses.new
  end

  def create
    @address = @contact.addresses.build(address_params)
    if @address.save
      redirect_to contact_path(@contact), notice: 'Endereço cadastrado com sucesso'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @address.update(address_params)
      redirect_to contact_path(@contact), notice: 'Endereço actualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to contact_path(@contact), notice: 'Endereço apagado com sucesso.'
  end

  private 

  def address_params
    params.require(:address).permit(:cep, :street, :number, :district, :city, :state)
  end

  def set_contact
    @contact = Contact.find_by(id: params[:id])
  end

  def set_address
    @address = @contact.addresses.find(params[:id])
  end
end
