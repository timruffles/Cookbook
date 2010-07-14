# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_BusinessCookbook_session',
  :secret      => 'd77fa3e1cd35dd4cabd45bb330075d21ed0c239dc7fe08f540f10e95e9f0993d42e067af885cbf7c2b06c1bf23361ceb61190c9c84e6b83d5ec11cd2295cce05'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
