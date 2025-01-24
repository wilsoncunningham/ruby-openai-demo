# Write your solution here!
require "openai"
require "dotenv/load"
require "pry"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

message_list = [
  {
    "role" => "system",
    "content" => "You are a helpful assistant."
  }
]


user_input = ""

puts "Hello! How can I help you today?"

while user_input != "bye"
  puts "-"*50
  user_input = gets.chomp
  
  # Add the user's message to the message list
  if user_input != "bye"
    puts "\n"
    message_list.append({"role" => "user","content" => user_input})

    # Send the message list to the API
    api_response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: message_list
      }
    )

    ai_message = api_response["choices"][0].fetch("message").fetch("content")
    
    puts ai_message
    puts "-"*50

    # Add the assistant's response to the message list
    message_list.push({ "role" => "assistant", "content" => ai_message })
  end
end

puts "Goodbye! Have a great day!"





# binding.pry
