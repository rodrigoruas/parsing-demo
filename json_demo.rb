require 'json'

# TODO - let's read/write data from beers.json
filepath    = 'data/beers.json'

# files are strings! everytime!
#read a file -> transform the json file into a string.

#1 transform the JSON file into a string.
serialized_beers = File.read(filepath)


#2 transform the string into a ruby element (hash, array)
beers = JSON.parse(serialized_beers)

first_beer = beers["beers"].first["name"]

puts "The first beer is #{first_beer}"

# p beers


# STORING  A JSON FILE

beers = { beers: [
  {
    name:       'Edelweiss',
    appearance: 'White',
    origin:     'Austria'
  },
  {
    name:       'Guinness',
    appearance: 'Stout',
    origin:     'Ireland'
  }
]}

# transform my hash/array into a string
string_beers = JSON.generate(beers)


filepath = "data/new_beers.json"
# open or create a file

# wb or ab (write or apend it to a file) -> giving permissions

File.open(filepath, 'wb') do |file|
  # write the json string into a .json file
  file.write(string_beers)
end

















