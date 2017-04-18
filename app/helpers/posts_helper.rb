module PostsHelper

	def get_id_video(url)
		id = url[32..url.length]
		return id
	end

	def get_embed_link(url)
		id = get_id_video(url)
		embed_link = "https://www.youtube.com/embed/"+id
		return embed_link
	end

	def get_img_video_link(url)
		id = get_id_video(url)
		img_video_link = "https://img.youtube.com/vi/"+id+"/mqdefault.jpg"
		return img_video_link
	end

end
