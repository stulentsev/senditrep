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
  
end