module Admin::MmanagersHelper
  
  def file_ext(file)
    p file
    ext = file.split(".")
    result = case ext[1]
    when "txt" then "<div class=\"file\" id=\"#{ext[1]}\"><div id=\"img_desc\">#{file}</div></div>"
    when "png" then "<div class=\"file\" id=\"#{ext[1]}\"><div id=\"img_desc\">#{file}</div></div>"
    when "jpg" then "<div class=\"file\" id=\"#{ext[1]}\"><div id=\"img_desc\">#{file}</div></div>"
    when "zip" then "<div class=\"file\" id=\"#{ext[1]}\"><div id=\"img_desc\">#{file}</div></div>"
    when "tar" then "<div class=\"file\" id=\"#{ext[1]}\"><div id=\"img_desc\">#{file}</div></div>"
    when "tgz" then "<div class=\"file\" id=\"#{ext[1]}\"><div id=\"img_desc\">#{file}</div></div>"
    when "rar" then "<div class=\"file\" id=\"#{ext[1]}\"><div id=\"img_desc\">#{file}</div></div>"
    when "pdf" then "<div class=\"file\" id=\"#{ext[1]}\"><div id=\"img_desc\">#{file}</div></div>"
    else "unknown: #{ext}"
    end
  end

end
