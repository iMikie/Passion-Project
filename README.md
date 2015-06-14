![Definition of Passion] (images/definition.png)
---

![Web/App Intersection] (images/PassionDiagram.png)

If you think about it, web apps and native apps seem to go about things in completely opposite ways.  The web server runs remotely and serves up pages; the native app runs locally and pulls down data.  One is written in Ruby, HTML, CSS and Javascript while the other is written in Swift or Java. 

Different architectures, different languages, yet it's the same app.  These days we must support both Web and Mobile. What can be done?  My passion project will implement each of the required technologies and then proceed to experiment with one or more ways to take them mobile or make it easy to do so.

---

###Mike Farr
michaelmfarr@gmail.com <br>
mikefarr@mac.com

####DBC sf-dragonflies-2015
---
<br><br><br>
###User Requirements:
* I want to use my apps via the web, my phone, my tablet and often on my PC/Mac.
* I don't want a lowest common denominator experience, each should exploit the best of it's platform
* I want my tablet and phone apps to feel like native apps
* I want my web experience to feel like a web experience when appropriate: if what I am doing is browsing and a page metaphore is appropriate, don't give me a fixed frame app.  When I resize a page of information, I want it to reflow.
* If the Internet is not available I should still have an app experience on my device using persistant data if appropriate.
 
###Developer Requirements:
* I don't want to have to write multiple separate apps
* I want to leverage MVC to keep the model and controller logic common while the view is free to change with output target
* I want to reduce the number of languages and frameworks I have to learn

###Background
In phase-1, we created several command line applications.  Taking advantage of the MVC paradigm one could swap out a vanilla command line view with something more interesting. Both my Sudoku solver and my Ruby Racer use this approach.  Here is RubyRacer (click to view video).

<a href="http://www.youtube.com/watch?feature=player_embedded&v=7eWvCm3l7pQ
" target="_blank"><img src="http://img.youtube.com/vi/7eWvCm3l7pQ/0.jpg" 
alt="Ruby Racer teaching example." width="560" height="315" border="10" /></a>

That's all well and good, but how far can this go? In the next video I replace the command-line View Module of our flashcard assignment with a RemoteView leaving the model and controller untouched.  The remote view manages a UI server I built as a native Macintosh application.  The UI server and the Ruby Flashcard app talk over sockets.  The UIServer is much like a browser except instead of HTML, it's Ruby objects that are indirectly being rendered. This is done through a RemoteView class leaving the rest of the program untouched.   
 
<a href="http://www.youtube.com/watch?feature=player_embedded&v=37ZlKUeJXfM
" target="_blank"><img src="http://img.youtube.com/vi/37ZlKUeJXfM/0.jpg" 
alt="Flashcard UI." width="560" height="315" border="10" /></a>

##The Application

The Web App I'd like to build to experiment with all this revolves around a sheet music database for the Men’s chorus I belong to at the St. Francis Yacht Club.  We have around 1,000 pieces of music with data on composer, lyricist, season (i.e. holiday), style, parts (i.e Tenor, Bass). We’d want to search on all those fields.  Additionally I think that storing the programs we sing gives the required many to many relation: Each song is in potentially many programs (think holiday favorites), each program contains many songs.  

####Minimum Viable Product
I have met several times with the stakeholders at the StFYC: the music director, the president of the SOTS, and the exec staff as well as the Director of Communications, IT manager and the General Manger.  We have agreed upon the following features for the initial release: 
<br>

1. Search the database on any of the fields (or combination thereof) below.  
2. CRUD on **songs**  
3. Retrieve a PDF of a song
4. Secure login
5. CRUD on **users**
	 
Relating performances to songs is more a factor of my need to deal with a many-to-many relationship so it is not in release 1.
	
  *Here is the initial schema. Users is an independant table.  Performances and Songs have a many to many relationship.  This is captured in the performances_songs table.
 <br>
###![Schema](schema.png)
    
Here is the information we’ll be storing for each of our...
####songs
* song_id		
* song_number		--the physical folder where the paper copy can be found.
* song_title
* composer
* larger_work		––if the song is part of a larger work: “King And I”    
* arranger1			
* arranger2
* voicing
* description
* pdf_url				
* created_at
* updated_at

The client has clarified that the description field is really a category.  Below are the currently enumerated values but I expect they shall grow.  National anthems may be the next as the club hosts teams from all over the world.  Rather than use a db enumeration I'll probably enforce this set by using a pop down menu.
* Christmas
* Broadway
* Sea Chanty
* Spiritual
* Sacred
* Patriotic
* FolkSong
* Original
* Other
* 

###Users
* name
* username
* email 
* phone_number
* password_hash
* created_at
* updated_at

####Performances
* id
* title
* date
* performance_time
* call_time
* location
* created_at
* updated_at


####Songs_Performaces
*id
*performance_id
*song_id
* created_at
* updated_at


##Routes
Resource | CRUD        |HTTP Verb | Path     | User for 
--------|--------------|-------|-------------|-----------
**User**| Create       | GET   | user/signup | requesting signup for a new user
      	| 					   | POST  | user/signup | retrieve data and create user
      	| Read         | GET   | /           | request login or signup
      	|              | POST  | /           | authenticate, go to home page
      	| Update       | GET   | /user/:id/edit  | make changes in user profile
      	|              | POST  | /user/edit

User
* Create
		1. sign_up
* Read
		2. login
		3. user_profile
* Update
		1. edit user_profile
* Delete
		1.
3. 


The club loaned me an intern who has around 800 pieces of sheet music scanned and we have meta data collected for about 500 of those.  

More screen designs to come.

###People
* id
* name
* password
* email
* phone
* status

###Songs
* Composer
* Lyricist
* Publisher
* Title
* Parts
* URLs of scanned sheet music PDF
* URLs to recordings

###Events
* id
* description
* location
* call time
* performance time
* contact_id


###Officials
* Title
* person_id
* term



