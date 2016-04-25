# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Vent.destroy_all
Response.destroy_all

Vent.create(name: "Jordan Ballard",
            body: "This is my first vent and I'm stoked to be here",
            mood: "good",
            allow_response: true)
Vent.create(name: "David Ballard",
            body: "I just won $50,000, suckas!!!!",
            mood: "good",
            allow_response: true)
Vent.create(name: "Cliff Morris",
            body: "I was about to tag an elk and it bolted and I missed my opportunity...",
            mood: "bad",
            allow_response: true)

Response.create(name: "Matt Vaden",
                body: "Welcome to The Vent!",
                vent_id: 1)
Response.create(name: "Pam Ballard",
                body: "Let's go on a cruise!",
                vent_id: 2)
Response.create(name: "PETA",
                body: "Good, you shouldn't be shooting at animals anyway!",
                vent_id: 3)
