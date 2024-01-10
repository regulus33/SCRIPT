with timeout of (600 * 30) seconds
	set destinationFolder to choose folder
	
	tell application "Photos"
		set thePhotos to every media item of album "Audio" 
		
		export thePhotos to destinationFolder without using originals
	end tell
end timeout