module ApplicationHelper
  
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
      id = content.scan(/\{gallery=(\d+)\}/).flatten[0]
    if !id.nil?
      partial_content = render :partial => 'share/gallery', :locals => {:id => id }
      content.gsub! /\{gallery=\d+\}/, partial_content
      return content.html_safe
    else
      content.gsub! /\{gallery=\d+\}/, ''
      content.html_safe
    end
  end    
    
end
