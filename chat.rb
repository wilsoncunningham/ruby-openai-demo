# Write your solution here!
require "openai"
require "dotenv/load"
require "pry"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))


puts "Hello! How can I help you today?"
puts "-"*50

query = gets.chomp
# query = "How do I compute 5*5?"

message_list = [
  {
    "role" => "system",
    "content" => "You are a helpful assistant who talks like Shakespeare."
  },
  {
    "role" => "user",
    "content" => query
  }
]

# Call the API to get the next message from GPT
api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  }
)

# pp api_response

ai_message = api_response["choices"][0].fetch("message").fetch("content")
puts ai_message
puts "-"*50

# binding.pry
