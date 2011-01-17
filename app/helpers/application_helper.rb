module ApplicationHelper
    
  def tag_content(tag)
    content_for(:tag) { "<meta name='keywords' content='#{tag}' />".html_safe}
  end
  
    def tab_link(name, path)
          if controller_path == "admin/images"
           content_tag :div, :class => (/^#{path}/ =~ "/admin/galleries" ? "selected" : nil) do
           link_to name, path, :class => "current"
            end
          else
            content_tag :div, :class => (/^#{path}/ =~ "/#{controller_path}" ? "selected" : nil) do
            link_to name, path, :class => "current"
           end
         end
    end
  
    
  def render_gallery(content)
    id = content.scan(/\{gallery=(\d+)\}/)
    if !id.nil?
      id.each do |id|
        partial_content = render :partial => 'share/gallery', :locals => {:id => id[0].to_i }
        content.sub! /\{gallery=\d+\}/, partial_content
      end
      return content.html_safe
    else
      content.gsub! /\{gallery=\d+\}/, ''
      content.html_safe
    end
  end  
    
end
