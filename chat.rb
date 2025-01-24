# Write your solution here!
require "openai"
require "dotenv/load"
require "pry"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))


# puts "Hello! How can I help you today?"
# puts "-"*50

# query = gets.chomp
# # query = "How do I compute 5*5?"
# puts "\n"

message_list = [
  {
    "role" => "system",
    "content" => "You are a helpful assistant."
  }
]

# Call the API to get the next message from GPT
# api_response = client.chat(
#   parameters: {
#     model: "gpt-3.5-turbo",
#     messages: message_list
#   }
# )

# ai_message = api_response["choices"][0].fetch("message").fetch("content")
# puts ai_message
# puts "-"*50




######################
user_input = ""


puts "Hello! How can I help you today?"
while user_input != "bye"
  # puts "Hello! How can I help you today?"
  puts "-"*50
  user_input = gets.chomp
  
  # Add the user's message to the message list
  if user_input != "bye"
    puts "\n"
    message_list.append({ "role" => "user", "content" => user_input })

    # Send the message list to the API
    api_response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: message_list
      }
    )

    # Dig through the JSON response to get the content
    choices = api_response.fetch("choices")
    first_choice = choices.at(0)
    message = first_choice.fetch("message")
    assistant_response = message["content"]
    
    # Print the assistant's response
    puts assistant_response
    puts "-"*50

    # Add the assistant's response to the message list
    message_list.push({ "role" => "assistant", "content" => assistant_response })
  end
end

########################

puts "Goodbye! Have a great day!"





# binding.pry
