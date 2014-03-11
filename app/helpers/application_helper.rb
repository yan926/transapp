module ApplicationHelper
  def full_title(page_title)
    base_title ='國立政治大學外國語文學院翻譯中心'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
