README
===============
On The Side 
===================

GA WDI NYC Jan 14, project 1
-------------------------------
A curated list of unexpected appetizers and side dishes to order right now, searchable by New York neighborhood.  


New York has always been a culinary destination.  More than the traditional "any type of takeout at any hour," the city is setting the pace for new and exciting dishes in America.  Too often, the delicious and unique menu items go overlooked, in favor of getting right to the main course.  Take some time, man.  Through "On The Side" we explore and celebrate these dishes, through our favorite ingredients at the moment. We hope to be a trusted source in expanding your culinary horizons.  


https://www.pivotaltracker.com/s/projects/1015704

API's and Gems

*Foursquare API

*Instagram API

*Instagram Gem

My initial goal with this project was to use the Yelp API to generate specific restaurant recommendations.  If we've spoken for more than 3 minutes I've probably suggested a place to eat.  After the initial API call results seemed a bit sketchy, I moved over to Foursquare, to greater success. 
The Instagram API and Gem were great to work with, giving accurate results...if not exactly the ones I was looking for (I can't be held responsible for the appropriateness of peoples images tagged at certain locations.)

When a user enters a New York neighborhood, an HTTP request is made to the Foursquare API, which returns a hash filled with unimaginable riches, limited to 5 restaurants.  This hash is then iterated through, returning the appropriate restaurant data based mostly on Foursquare user "tips".  

The associated Foursquare Venue ID is then used in conjunction with the Istagram Gem to find the Instgram Venue ID (different ID's entirely) to return an image tagged at that location, selected at random.  

The user can then save a favorite from the list of search results, and delete it if they decide the restaurant was terrible.  But that's on them.  


<tt>rake doc:app</tt>.


