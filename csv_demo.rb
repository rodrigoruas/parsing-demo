require 'csv'

# PARSING
# TODO - let's read/write data from beers.csv

filepath    = 'data/beers.csv'

# hash of informations that I can pass when I parse my csv file
csv_options = { col_sep: ',', headers: :first_row, quote_char: '"'}

# parsing without csv options

CSV.foreach(filepath) do |beer|
  # Here, row is an array of columns
  puts "#{beer[0]} | #{beer[1]} | #{beer[2]}"
end

csv_options = { col_sep: ',', headers: :first_row, quote_char: '"'}

# parsing with csv options

puts "Name | Appearance | Origin"

CSV.foreach(filepath, csv_options) do |beer|
  puts "#{beer["Name"]} | #{beer["Appearance"]} | #{beer["Origin"]}"
end



# STORING INTO A CSV FILE

csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
filepath    = 'data/new_beers.csv'

beers = [
      {
        name: "Asahi",
        appearance: "Pale Lager",
        origin: "Japan"

      },
      {
        name: "Guinness",
        appearance: "Stout",
        origin: "Ireland"
      }
    ]

#File.open -> ruby method
  # wb -> writing binary -> I am writing into a file
  # ab -> appending binary -> append to the existing file
  # rb -> reading binary -> read the file.

CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ['Name', 'Appearance', 'Origin']
  beers.each do |beer|
    csv << [beer[:name], beer[:appearance], beer[:origin]]
  end
end
















