h = JSON.parse File.read 'firebase.json'

h['videos']['public'].each do |k, v|
  vid = v.except('date').merge('youtube_id': k)
  vid['duration'] = vid.delete 'time'
  Video.create! vid
end

Video.find_by(youtube_id: 'UsQyXalPcss').update! featured: true
Video.find_by(youtube_id: 'a4DAeGMvLYs').update! featured: true