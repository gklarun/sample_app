# All images uploaded as pngs so padding can be transparent (out to large image size of 750x500)
# This was a bit of a workaround to get carosel looking good.
class ClubImageUploader < CarrierWave::Uploader::Base

	# Include RMagick or MiniMagick support:
	include CarrierWave::RMagick
	# include CarrierWave::MiniMagick

	# Override the directory where uploaded files will be stored.
	# This is a sensible default for uploaders that are meant to be mounted:
	def store_dir
		"uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
	end

	# Provide a default URL as a default if there hasn't been a file uploaded:
	# def default_url
	#   # For Rails 3.1+ asset pipeline compatibility:
	#   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
	#
	#   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
	# end

	# Process files as they are uploaded:
	process :fix_exif_rotation
	process :strip
	process :resize_portrait_vs_landscape => [750, 500]

	# def scale(width, height)
	#   # do something
	# end

	version :large do
		process :fix_exif_rotation
		process :strip
		resize_and_pad(750, 500)
	end

	# Thumb image to display in :
	version :small do
		process :fix_exif_rotation
		process :strip
		process :resize_to_fill => [250, 250]
	end

	version :thumb do
		process :fix_exif_rotation
		process :strip
		process :resize_to_fill => [50, 50]
	end

	# Add a white list of extensions which are allowed to be uploaded.
	# For images you might use something like this:
	def extension_white_list
		%w(jpg jpeg gif png image/png)
	end

	# Override the filename of the uploaded files if we want them converted to png
	# def filename
	# change_ext_to_png(original_filename) if original_filename
	# end

	private

	def resize_portrait_vs_landscape(crop_width, crop_height)
		img = Magick::Image.read(current_path)
		width = img[0].columns
		height = img[0].rows
		if width > height
			# original is landscape
			resize_to_fill(crop_width, crop_height)
		else
			# original is portrait (pad out to crop_width)
			resize_to_fit(crop_width, crop_height)
		end
	end

	def change_ext_to_png(ext)
		ext.chomp(File.extname(ext)) + ".png"
	end

end
