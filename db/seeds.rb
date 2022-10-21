# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'nokogiri'

html_file = URI.open("https://www.footballtransfers.com/en/transfer-news/es-la-liga/2022/08/european-golden-shoe-2022-23-latest-goalscoring-standings").read
html_doc = Nokogiri::HTML(html_file)

puts "Cleaning database"
Club.destroy_all
Player.destroy_all

regex = /(\w+\s?\w+)\s\((\w+\s?\w+)\)(\d+)(\d{2})/
player_info = []

# Scrape page

html_doc.css("tr").each do |stats|
  info = stats.text.split(regex)
  player_info << info
end

stats_array = player_info.map { |player|
  name = player[1]
  team = player[2]
  goals = player[3]
  club = Club.new(name: team)
  club.save
  player = Player.new(name: name, goals: goals)
  player.club = club
  player.save
}.slice(1,10)

# @review.restaurant = @restaurant

puts "gathering info"

puts "saving info"

puts "Database created"
