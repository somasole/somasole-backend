# articles
h = JSON.parse File.read 'firebase.json'

h['featured']['articles'].values.each do |v|
  Article.create! v
end


# videos
h = JSON.parse File.read 'firebase.json'

h['videos']['public'].each do |k, v|
  vid = v.except('date').merge('youtube_id': k)
  vid['duration'] = vid.delete 'time'
  Video.create! vid
end

Video.find_by(youtube_id: 'UsQyXalPcss').feature!
Video.find_by(youtube_id: 'a4DAeGMvLYs').feature!


# workouts
h = JSON.parse File.read 'firebase.json'

TAGS = ['Upper Body', 'Core', 'Lower Body', 'Total Body'].freeze

h['workouts']['public'].each do |k, v|
  workout = Workout.create! v.slice(%i[description intensity time]).merge(name: k)

  v['tags'].each { |tag_num| workout.tags.append Tag.find_or_create_by! name: TAGS[tag_num] }

  v['circuits'].each do |c|
    setup = Setup.find_or_create_by! legacy_index: c['setup']['index'], length: c['setup']['length']
    circuit = Circuit.create! sets: c['sets'], workout: workout, setup: setup

    c['movements'].each do |m|
      Movement.create! circuit: circuit,
                       time: m.first.second,
                       description: h['movements'][m.first.first[1..-1].to_i]['description'],
                       title: h['movements'][m.first.first[1..-1].to_i]['name']
    end
  end
end

Workout.find_by(name: 'Armageddon').feature!
