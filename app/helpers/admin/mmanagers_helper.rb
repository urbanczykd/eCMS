module Admin::MmanagersHelper
  
  def file_ext(file)
    ext = file.split(".")
    result = case ext[1]
    when "txt" then "<div class=\"file\" id=\"#{ext[1]}\"></div><p id=\"tdesc\">#{link_to file, show_file_admin_mmanagers_path(:f=>file)}</p>"
    when "png" then "<div class=\"file\" id=\"#{ext[1]}\"></div><p id=\"tdesc\">#{link_to file, show_file_admin_mmanagers_path(:f=>file)}</p>"
    when "jpg" then "<div class=\"file\" id=\"#{ext[1]}\"></div><p id=\"tdesc\">#{link_to file, show_file_admin_mmanagers_path(:f=>file)}</p>"
    when "zip" then "<div class=\"file\" id=\"#{ext[1]}\"></div><p id=\"tdesc\">#{link_to file, show_file_admin_mmanagers_path(:f=>file)}</p>"
    when "tar" then "<div class=\"file\" id=\"#{ext[1]}\"></div><p id=\"tdesc\">#{link_to file, show_file_admin_mmanagers_path(:f=>file)}</p>"
    when "tgz" then "<div class=\"file\" id=\"#{ext[1]}\"></div><p id=\"tdesc\">#{link_to file, show_file_admin_mmanagers_path(:f=>file)}</p>"
    when "rar" then "<div class=\"file\" id=\"#{ext[1]}\"></div><p id=\"tdesc\">#{link_to file, show_file_admin_mmanagers_path(:f=>file)}</p>"
    when "pdf" then "<div class=\"file\" id=\"#{ext[1]}\"></div><p id=\"tdesc\">#{link_to file, show_file_admin_mmanagers_path(:f=>file)}</p>"
    when "doc" then "<div class=\"file\" id=\"#{ext[1]}\"></div><p id=\"tdesc\">#{link_to file, show_file_admin_mmanagers_path(:f=>file)}</p>"
   when "docx" then "<div class=\"file\" id=\"#{ext[1]}\"></div><p id=\"tdesc\">#{link_to file, show_file_admin_mmanagers_path(:f=>file)}</p>"
    else "unknown: #{ext}"
    end
  end

  def folder(dir)
    result = case dir
    when "images" then "<div class=\"folder\" id=\"#{dir}\"></div><p id=\"tdesc\">#{dir}</p>"      
when "zdjecia" then "<div class=\"folder\" id=\"#{dir}\"></div><p id=\"tdesc\">#{link_to dir, place_admin_mmanagers_path(:dir => @mmanager_path+dir)}</p>"      
else "<div class=\"folder\"></div><p id=\"tdesc\">#{link_to dir, place_admin_mmanagers_path(:dir => session[:path]+dir+"/")}</p>"
    end
  end
  

end
