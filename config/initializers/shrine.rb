require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"

s3_options = {
    access_key_id:     "AKIAI4IIFIG4MFLR2JSQ",
    secret_access_key: "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",
    region:            "us-west-1",
    bucket:            "somasole",
}

Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
    store: Shrine::Storage::S3.new(prefix: "store", **s3_options),
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for forms