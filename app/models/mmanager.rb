class Mmanager < ActiveRecord::Base
  
    def self.save(upload, directory)
    name =  upload.original_filename

    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(upload.read) }
  end

end
