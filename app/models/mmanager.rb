class Mmanager < ActiveRecord::Base
  
  def self.save(upload, directory)
    name = upload.original_filename
    name = name.split(".")
    name = name[0].parameterize+"."+name[1].downcase.chomp

    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(upload.read) }
  end
  
  

end
