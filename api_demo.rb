require 'json'

# open-uri module opens webpages.
require 'open-uri'

# TODO - Let's fetch name and bio from a given GitHub username
url = 'https://api.github.com/users/ssaunier'

# access the API -> open the url

#1 transforming json into a string
serialized_user = open(url).read

#2 transform my json string into a ruby hash
user = JSON.parse(serialized_user)

p "#{user["login"]} has #{user["followers"]} followers"
