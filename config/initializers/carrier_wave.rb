
CarrierWave.configure do |config|

	# Use local storage if in development or test
	if Rails.env.development? || Rails.env.test? || Rail.env.production?
		config.storage = :file
	end

	# no processing in test
	if Rails.env.test?
		config.enable_processing = false

		# use different dirs when testing
		CarrierWave::Uploader::Base.descendants.each do |klass|
			next if klass.anonymous?
			klass.class_eval do
				def cache_dir
					"#{Rails.root}/spec/support/uploads/tmp"
				end

				def store_dir
					"#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
				end
			end
		end
	end




	# Optional: Signing of download urls, e.g. for serving private
	# content through CloudFront.
	#config.aws_signer = -> (unsigned_url, options) { Aws::CF::Signer.sign_url unsigned_url, options }
end


module CarrierWave
	module RMagick

		#Rotate image based on EXIF orientation (e.g. phones don't actually rotate image, just update EXIF info)
		def fix_exif_rotation
			manipulate! do |img|
				img.auto_orient!
				img  = yield(img) if block_given?
				img
			end
		end

		#Strip out all embedded info from image
		def strip
			manipulate! do |img|
				img.strip!
				img  = yield(img) if block_given?
				img
			end
		end

		def resize_and_minor_crop(width, height, gravity=::Magick::CenterGravity)
			geometry = get_geometry
			if (geometry.first > geometry.last)
				#landscape
				manipulate! do |img|
					img.crop_resized!(width, height, gravity)
					img  = yield(img) if block_given?
					img
				end

			else
				#portrait - need to find resize function to not crop!
			end
		end

		# return [width, height]
		def get_geometry
			img = Magick::Image.read(current_path)
			width = img[0].columns
			height = img[0].rows
			geometry = [width, height]
		end

	end

end