class Contact

  
  def save(contact)
    if contact[:title].empty?
      return false
    elsif contact[:message].empty?
      return false
    elsif contact[:sender_email].empty?
      return false
    else
      #dopisać adres odbioru przez użytwkownika cms'a
      @app_config = YAML::load(File.open("#{RAILS_ROOT.to_s}/config/config.yml"))
      ContactMailer.con_mailer(@app_config["contact"]["user_name"], contact, "Wiadomosc z strony")
    end
  end


end
