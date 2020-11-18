class ShowHTML

  def initialize(filename = "index.html")
    file = File.new("#{filename}", "w")
    file.puts "<!DOCTYPE html>"
    file.puts "<html>"
    file.puts "<head>"
    file.puts "  <title>My HTML</title>"
    file.puts "</head>"
    file.puts "<body>"
    file.puts "<p>[content]</p>"
    file.puts "</body>"
    file.puts "</html>"
    file.close

    @template = File.read("#{filename}")
  end

   # ↓↓↓  Для работы с консолью  ↓↓↓
  def html_from_console(content, bypass_html:false) # передавать bypass_html:true чтобы НЕ резать скрипты
    content.gsub! /[<>]/ , '&#128298;' if !bypass_html # режет скрипты в прямом смысле :)
    File.open("created_html.html", "w") do |file|
      @template.gsub! "[content]" , content
      file.puts @template
    end
  end
end