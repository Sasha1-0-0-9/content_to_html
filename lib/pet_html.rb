class StateToHTML

  def html_for_pet(name, state, help) # для работы с Тамагочи
  	content = File.read("index.html")
  	File.open("pet.html", "w") do |file|
  		emoji = state[-1]
  		state.delete_at(-1)
  		content.gsub! "[name]" , name
  		content.gsub! "[state]" , state.join("<br>")
  		content.gsub! "[emoji]" , emoji
  		content.gsub! "[help]" , help
  		file.puts content
  	end
  end
end