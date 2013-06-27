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


  
end