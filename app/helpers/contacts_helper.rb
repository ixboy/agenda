module ContactsHelper
  def date_helper(datetime)
    datetime.strftime('%e - %B - %Y')
  end

  def new_contact_link
    return unless current_user

    link_to 'Cadastrar um novo contato',
            new_contact_path(current_user),
            class: 'btn btn-primary'
  end

  def edit_contact_link(user, contact)
    return unless user && user.id == contact.user.id

    link_to 'Editar', edit_contact_path(contact),
            class: 'btn btn-warning'
  end

  def edit_address_link(user, contact, address_id)
    return unless user && user.id == contact.user.id

    link_to 'Editar', "/contacts/#{contact.id}/addresses/#{address_id}/edit",
            class: 'btn btn-success'
  end

  def mais_info_link(contact)
    return unless contact

    link_to 'Mais Info...', contact_path(contact),
            class: 'btn btn-success'
  end

  def delete_contact_link(user, contact)
    return unless user && user.id == contact.user.id

    link_to 'Excluir', contact_path(contact), data: {
      method: :delete,
      confirm: 'Tem certeza que deseja excluir?'
    }, class: 'btn btn-danger'
  end
end
