class Api::V1::ApplicationSerializer < ActiveModel::Serializer
  include Pundit

  def serializable_hash(adapter_options = nil, options = {}, adapter_instance = self.class.serialization_adapter_instance)
    hash = super
    hash.each { |key, value| hash.delete(key) if value.nil? }
    hash
  end

  def file_serializer(attribute_name)
    file = object.send(attribute_name)
    return nil if file.blank?

    {
      url: file.url,
      name: object.send("#{attribute_name}_identifier")
    }
  end

  protected

  def default_url_options
    Rails.application.config.action_mailer.default_url_options
  end
end