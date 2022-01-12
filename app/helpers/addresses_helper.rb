module AddressesHelper
  def format(phone)
    return phone.to_s.sub(/(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})/, "\\1 \\2 \\3 \\4 \\5 " )
  end
end
