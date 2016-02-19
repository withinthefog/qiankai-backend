Paperclip::Attachment.default_options[:storage] = :qiniu
Paperclip::Attachment.default_options[:qiniu_credentials] = {
    access_key: ENV['QINIU_ACCESS_KEY'] || ENV['RAILS_ENV'] == 'production' && raise("set env QINIU_ACCESS_KEY"),
    secret_key: ENV['QINIU_SECRET_KEY'] || ENV['RAILS_ENV'] == 'production' && raise("set env QINIU_SECRET_KEY")
}
Paperclip::Attachment.default_options[:bucket] = 'shangju'
Paperclip::Attachment.default_options[:use_timestamp] = false
Paperclip::Attachment.default_options[:qiniu_host] = 'http://7xjdwj.com1.z0.glb.clouddn.com'
Paperclip::Attachment.default_options[:path] = ':attachment/:id_partition/:style/:filename'