RubyLLM.configure do |config|
  config.openai_api_key = ENV["GITHUB_TOKEN"]
  config.openai_api_base = "https://models.inference.ai.azure.com"
  config.anthropic_api_key = ENV["ANTHROPIC_API_KEY"]

  # config.default_model = "gpt-4.1-nano"
end
