class Contact
# include ActiveRecord::Validations

#  validates :title, :presence => true
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
    ContactMailer.contact_mailer(@app_config["contact"]["user_name"], contact[:message], contact[:title]).deliver
    return true
  end
end


end
