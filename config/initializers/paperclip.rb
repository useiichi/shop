if Rails.env.production?
  #  Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
  #  Paperclip::Attachment.default_options[:url] = ':gcs_domain_url'
  #  Paperclip::Attachment.default_options[:fog_directory] = "solidus"#ENV['GCS_BUCKET_NAME']
  
  Paperclip::Attachment.default_options[:storage] = :gcs
  Paperclip::Attachment.default_options[:gcs_bucket] = "solidus"
  Paperclip::Attachment.default_options[:url] = ":gcs_path_url"
  Paperclip::Attachment.default_options[:path] = "images/:id/:style/:filename"
  Paperclip::Attachment.default_options[:gcs_credentials] = {
      project: "root-talon-161808",#ENV["GCS_PROJECT"],
      keyfile: "/var/www/gcs_keyfile",#ENV["GCS_KEYFILE"],
  }

  Spree::Image.attachment_definitions[:attachment].delete(:url)
  Spree::Image.attachment_definitions[:attachment].delete(:path)
end