# encoding: utf-8

class ProfilePhotoUploader < CarrierWave::Uploader::Base

	# Include RMagick or MiniMagick support:
	include CarrierWave::RMagick
	# include CarrierWave::MiniMagick

	# Override the directory where uploaded files will be stored.
	# This is a sensible default for uploaders that are meant to be mounted:
	def store_dir
		"uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
	end

	# Process files as they are uploaded:
	process :fix_exif_rotation
	process :strip

	version :large do
		process :resize_to_fill => [300, 300]
	end

	version :small do
		process :resize_to_fill => [250, 250]
	end

	version :thumb do
		process :resize_to_fill => [70, 70]
	end

	# Add a white list of extensions which are allowed to be uploaded.
	# For images you might use something like this:
	def extension_white_list
		%w(jpg jpeg gif png)
	end

end
