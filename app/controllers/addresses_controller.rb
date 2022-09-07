class AddressesController < ApplicationController

  def new
    session[:contact] = Contact.find_by(id: params[:contact_id])
  end

  def create
    @contact = session[:contact]
    @address = Address.create(address_params)
    @address.contact_id = @contact["id"]
    if @address.save
      session[:contact] = nil
      redirect_to contact_path(@contact["id"]), notice: 'Endereço cadastrado com sucesso'
    else
      render :new
    end
  end

  private 

  def address_params
    params.require(:address).permit(:cep, :street, :number, :district, :city, :state, :contact_id)
  end
end
