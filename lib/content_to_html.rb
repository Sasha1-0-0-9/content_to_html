class ShowHTML

  def create_template(filename = "index.html")
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
    template = File.read("#{filename}")
    return template
  end

   # ↓↓↓  Для работы с консолью  ↓↓↓
  def html_from_console(content, bypass_html:false) # передавать bypass_html:true чтобы НЕ резать скрипты
    text = create_template
    content.gsub! /[<>]/ , '&#128298;' if !bypass_html # режет скрипты в прямом смысле :)
    File.open("created_html.html", "w") do |file|
      text.gsub! "[content]" , content
      file.puts text
    end
  end

# ↓↓↓  Для работы с Тамагочи  ↓↓↓
  def html_for_pet(name, state)
  	content = File.read("index.html")
  	File.open("pet.html", "w") do |file|
  		emoji = state[-1]
  		state.delete_at(-1)
  		content.gsub! "[name]" , name
  		content.gsub! "[state]" , state.join("<br>")
  		content.gsub! "[emoji]" , emoji
  		file.puts content
  	end
  end
end