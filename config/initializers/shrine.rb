require 'shrine'
require 'shrine/storage/file_system'
require 'shrine/storage/s3'

s3_options = {
    access_key_id:     ENV['S3_KEY'],
    secret_access_key: ENV['S3_SECRET_KEY'],
    region:            ENV['S3_REGION'],
    bucket:            ENV['S3_BUCKET'],
}

Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
    store: Shrine::Storage::S3.new(prefix: 'store', **s3_options),
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for forms