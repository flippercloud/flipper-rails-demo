# Helper to get an encrypted token from Cloud and securely store it in the session
class EncryptedToken
  MESSAGE_ENCRYPTER = ActiveSupport::MessageEncryptor.new(
    Rails.application.key_generator(ENV["DEMO_SHARED_KEY"] || "demo").
      generate_key("cloud-token", ActiveSupport::MessageEncryptor.key_len),
    url_safe: true
  )

  Invalid = Class.new(StandardError)

  def self.decrypt(data, ...)
    MESSAGE_ENCRYPTER.decrypt_and_verify(data, ...) || raise(Invalid)
  rescue ActiveSupport::MessageEncryptor::InvalidMessage
    raise Invalid
  end

  def self.encrypt(value, ...)
    MESSAGE_ENCRYPTER.encrypt_and_sign(value, ...)
  end
end
