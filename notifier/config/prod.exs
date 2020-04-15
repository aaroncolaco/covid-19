import Config

config :notifier,
  admin_secret: System.get_env["NOTIFIER_SECRET"]

config :notifier, :msg91,
  auth_key: System.get_env["MSG91_AUTH_TOKEN"]
  sender: "CORONA"

config :notifier, :twilio,
  auth_token: System.get_env["TWILIO_AUTH_TOKEN"]
  user_name: System.get_env["TWILIO_USER_NAME"]
