module ContactsHelper
  def date_helper(datetime)
    datetime.strftime('%e - %B - %Y')
  end
end
