Paperclip::Attachment.default_options[:storage] = :qiniu
Paperclip::Attachment.default_options[:qiniu_credentials] = {
    access_key: 'KlxVSsL1hUD4PiBtfW4fE-DkzcHpUrOJRakTYNKU',
    secret_key: 'f-Ym1KwlcisuywykVIcCu9jjMOhPiIaeJNMlt-eN'
}
Paperclip::Attachment.default_options[:bucket] = 'shangju'
Paperclip::Attachment.default_options[:use_timestamp] = false
Paperclip::Attachment.default_options[:qiniu_host] = 'http://7xjdwj.com1.z0.glb.clouddn.com'
Paperclip::Attachment.default_options[:path] = ':attachment/:id_partition/:style/:filename'