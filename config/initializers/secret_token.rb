# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Mediafunnel::Application.config.secret_key_base = ENV['MEDIAFUNNEL_SECRET'] || '834f449f19f66fa9997954772a2a19119541b7d5e5f7ff9c62f0847b0b4701e83483b359ce91bd2dacd42c3bf69f4f0947b50795c21ea3d2b6343472c2937c19'
