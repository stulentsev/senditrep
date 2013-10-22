namespace :import do

  desc "Import EMS locations' data to db."
  task :ems => :environment do

    flocation = File.open('./lib/tasks/emslocation.json')
    location = flocation.read
    locs = eval(location)
    locs.each do |loc|
      puts loc['name'] + ' '+ loc['value'] + ' ' + loc['type']
      p = Emslocation.create!({
        :locationtype => loc['type'],
        :name => loc['name'],
        :value => loc['value']
      }
      )
    end
  end

  desc "Import CDEK locations' ID from csv to db"
  task :cdek => :environment do
    result = 0
    File.open('./lib/tasks/city_cdek.csv').each_line do |line|
        city = line.gsub("\n","").split(',')
        puts city[1]
        p = CdekLocation.create!({
          :num => city[0],
          :cityname => city[1].mb_chars.downcase
          })
    end
      
  end

  desc "Import all locations with indexes and regions in DB"
  task :all => :environment do
    result = 0
    File.open('./lib/tasks/city.csv').each_line do|line|
      line = line.gsub("\n","").mb_chars.downcase.split(";")
      
      next if line[3].nil? or line[3].empty?
      line[3] = line[3].split(",")

      result = City.create!({
        :city_name => line[0],
        :city_region => line[1],
        :center => !line[2].empty?
      })

      line[3].each do |index|
        result.indices.create({
            :city_index => index.to_i
          })
      end
      p result
    end
  end

  desc "Export all cities with regions to js array"
  task :export_all_js => :environment do
    f = File.new('./lib/tasks/city_and_region.txt', "w")
    f.write "["
    City.all.each do |city|
      if city.center
        line = "\"#{city.city_name.mb_chars.titleize}\","
      else
        line = "\"#{city.city_name.mb_chars.titleize}, #{city.city_region.mb_chars.titleize}\","
      end
      f.write line
      p line
    end
    f.write "];"
  end
end