CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :file
   elsif Rails.env.development?
     config.storage = :file
  else
    config.storage = :file
  end
end