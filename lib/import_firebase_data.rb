class ImportFirebaseData
  TAGS = ['Upper Body', 'Core', 'Lower Body', 'Total Body'].freeze

  def import
    destroy_existing

    get_data

    create_articles

    create_videos

    create_workouts
  end

  private

  def destroy_existing
    Article.destroy_all
    Video.destroy_all
    Workout.destroy_all
    Setup.destroy_all
    Tag.destroy_all

    puts 'Destroyed existing :)'
  end

  def get_data
    @data = JSON.parse File.read 'firebase.json'

    puts 'Got data :)'
  end

  def create_articles
    @data['featured']['articles'].values.each do |v|
      Article.create! v
    end

    puts 'Created articles :)'
  end

  def create_videos
    @data['videos']['public'].each do |k, v|
      Video.create! v.merge('youtube_id' => k, 'duration' => v['time']).except('date', 'time')
    end

    Video.find_by(youtube_id: 'UsQyXalPcss').feature!
    Video.find_by(youtube_id: 'a4DAeGMvLYs').feature!

    puts 'Created videos :)'
  end

  def create_workouts
    @data['workouts']['public'].each do |k, v|
      workout = Workout.create! v.slice('description', 'intensity', 'time').merge(name: k)

      v['tags'].each { |tag_num| workout.tags.append Tag.find_or_create_by! name: TAGS[tag_num] }

      v['circuits'].each do |c|
        setup = Setup.find_or_create_by! legacy_index: c['setup']['index'], length: c['setup']['length']
        circuit = Circuit.create! sets: c['sets'], workout: workout, setup: setup

        c['movements'].each do |m|
          Movement.create! circuit: circuit,
                           time: m.first.second,
                           description: @data['movements'][m.first.first[1..-1].to_i]['description'],
                           title: @data['movements'][m.first.first[1..-1].to_i]['title']
        end
      end
    end

    Workout.find_by(name: 'Armageddon').feature!

    puts 'Created workouts :)'
  end
end

def main
  ImportFirebaseData.new.import
  puts 'Succeeded!'
rescue
  puts 'Fucking failed.'
end

main
