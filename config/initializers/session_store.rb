# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_upload_1_session',
  :secret      => '0315b7f8ce3ca5b6259d012d59c209332495008b591377aada397fadff907b162070ec12b8aae9876106c97bf6862f5c9682dd4006b78306de342b6e8ffd2680'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
