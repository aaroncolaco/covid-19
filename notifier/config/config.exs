import Config

state_map = %{
  "AP" => "Andhra Pradesh",
  "AR" => "Arunachal Pradesh",
  "AS" => "Assam",
  "BR" => "Bihar",
  "CG" => "Chhattisgarh",
  "GA" => "Goa",
  "GJ" => "Gujarat",
  "HR" => "Haryana",
  "HP" => "Himachal Pradesh",
  "JK" => "Jammu and Kashmir",
  "JH" => "Jharkhand",
  "KA" => "Karnataka",
  "KL" => "Kerala",
  "MP" => "Madhya Pradesh",
  "MH" => "Maharashtra",
  "MN" => "Manipur",
  "ML" => "Meghalaya",
  "MZ" => "Mizoram",
  "NL" => "Nagalan",
  "OR" => "Orissa",
  "PB" => "Punjab",
  "RJ" => "Rajasthan",
  "SK" => "Sikkim",
  "TN" => "Tamil Nadu",
  "UK" => "Uttarakhand",
  "UP" => "Uttar Pradesh",
  "WB" => "West Bengal",
  "TR" => "Tripura",
  "AN" => "Andaman and Nicobar Islands",
  "CH" => "Chandigarh",
  "DH" => "Dadra and Nagar Haveli",
  "DD" => "Daman and Diu",
  "DL" => "Delhi",
  "LD" => "Lakshadweep",
  "PY" => "Pondicherry"
}

config :notifier,
  admin_secret: "myTopSecretToken",
  data_refresh_interval: 1000 * 60 * 60,
  db_url: "mongodb://localhost:27017/covid",
  # hour of the day to send at in UTC time
  notification_time: ~T[01:30:00],
  sms_provider:
    System.get_env()["SMS_PROVIDER"]
    |> (fn
          "msg91" -> :msg91
          _ -> :twilio
        end).(),
  state_map: state_map

config :notifier, :msg91,
  auth_key: "Secret Auth Key",
  sender: "CORONA",
  url: "https://api.msg91.com/api/v2/sendsms"

config :notifier, :twilio,
  auth_token: "Auth Token",
  from_number: "+16123241660",
  url:
    "https://api.twilio.com/2010-04-01/Accounts/AC9d209debd6a303ceb6e7b4b8c2f48be6/Messages.json",
  user_name: "Account ID"

config :logger,
  compile_time_purge_matching: [
    [application: :mongodb_driver],
    [level_lower_than: :info]
  ]

import_config "#{Mix.env()}.exs"
