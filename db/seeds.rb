# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sian = User.create(email: "sian.m.stone@gmail.com", password: "foobar", username: "siansian")


# C O L O U R   T H E M E S
pinks = ColourTheme.create(
  dark: 'rgb(248, 88, 88)',
  light: 'rgba(255, 220, 220)',
  highlight: 'rgb(250, 237, 237)',
  user: sian
)

purples = ColourTheme.create(
  dark: 'rgb(193, 86, 255)',
  light: 'rgb(238, 220, 255)',
  highlight: 'rgb(249, 243, 254)',
  user: sian
)

# blues = ColourTheme.create(
#   dark: 'rgb(248, 88, 88)',
#   light: 'rgba(255, 220, 220)',
#   highlight: 'rgb(250,  237, 237)'
# )

# P A N E L S
today = Panel.create(name: "today", colour_theme: pinks, user: sian)
soon = Panel.create(name: "soon", colour_theme: purples, user: sian)
someday = Panel.create(name: "someday", colour_theme: pinks, user: sian)


# T A S K S
Task.create(user: sian, text: "Learn about react", completed: false, panel: today)
Task.create(user: sian, text: "Feed unicorn", completed: false, panel: today)
Task.create(user: sian, text: "code some stuff", completed: false, panel: today)

Task.create(user: sian, text: "Sign up for machine learning course at NOVA", completed: false, panel: soon)
Task.create(user: sian, text: "Order hardcopy of The Order Of Time", completed: false, panel: soon)

Task.create(user: sian, text: "Buy an Island", completed: false, panel: someday)
Task.create(user: sian, text: "PhD in particle physics", completed: false, panel: someday)

