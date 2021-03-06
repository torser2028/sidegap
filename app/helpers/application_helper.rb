module ApplicationHelper
  def ldate(date, opts = {})
    date ? l(date, opts) : nil
  end

  # require 'open-uri'
	def embed_remote_image(url, content_type)
		begin
		  asset = open(url, "r:UTF-8") { |f| f.read }
		  base64 = Base64.encode64(asset.to_s).gsub(/\s+/, "")
		  "data:#{content_type};base64,#{Rack::Utils.escape(base64)}"
		rescue Exception => e
			nil
		end
	end
end
