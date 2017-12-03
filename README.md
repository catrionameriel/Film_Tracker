#SeeSaw

A film tracking app that allows the user to store films that they want to see, including the release date, but also has an archive in order to keep track of films that they have seen as well, along with the users rating of that films. This serves as a useful archive and recommendation tool but also easily places the unseen films in another section once they have been watched.

#Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

##Prerequisites

To run this web app, you will need to be able to run:
- Sinatra
- Postrgres
- Ruby

1 - You will need to create a database called FilmTracker
2 - Run the database and SQL file by typing psql -d FilmTracker -f db/film_tracker.SQL
3 - Run the seeds.rb, also situated in the db folder
4 - Run the app.rb using port: 4567
5 - Open the localhost:4567/ in your URL

#Motivation

This web app was created as part of a week long project undertaken while attending CodeClan's 16-week intensive course. At the beginning of the week, we were given four briefs to choose from in which we would implement, consolidate and expand on everything we'd learnt so far.
This included:
- Ruby fundamentals
- TDD (where appropriate)
- OOP
- Web Programming ( REST/MVC )
- Databases with CRUD actions

Despite some interesting briefs, I had a burning idea for a Film Tracking app. As nothing quite like this exists on the market, I wanted to create my own, using the tools I had.


#Brief

## FilmTracker
You hate missing out on seeing films that sound amazing but also hate beginning to watch a film before realising that you have already seen it! So you have decided to build an app that tracks films that you want to see and that you have seen.

You must be able to input new films (which should include a title and the date it came out) which have an associated Genre Tag (e.g. 'comedy', 'horror') and rating (1-5). Your app would then be able to track all the films and whether you have seen them or not and display this in a view.

### MVP:

- Create new films
- Display a list of the films
- Update the films when you have seen them
- Display films by genre tag
- Display films by rating

### Possible Extensions:

- CRUD actions for the films and genres
- Add a date seen to the films
- Any other ideas you might come up with


#Authors

Catriona Meriel - Original author and creator of SeeSaw


##Contributing

Please read CONTRIBUTING.md for details on our code of conduct, and the process for submitting pull requests to us.
