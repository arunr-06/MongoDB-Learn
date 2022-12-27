#Show all the sample dbs in the cloud environment 
show dbs 

#Show the active db
db

#Create a db named arun
use arun

#Create a collection in the active db 
db. createCollection("movies") 

#Show all the collections in the db 
show collections 

#Insert many values inside the collection. insertMany(M in caps)
db.movies.insertMany([{name:'PS1', year: 2022 , place: 'Chennai' , mode:'Theatre' , rating: 7.5, amount: 650},
{name:'Thor', year: 2022 , place: 'Chennai' , mode:'Theatre' , rating: 5.5},
{name:'Glass&Onion', year: 2022 , place: 'Coimbatore' , mode:'Netflix' , rating: 8.5},
{name:'Love today', year: 2023 , place: 'Bangalore' , mode:'Theatre' , rating: 8.1, amount: 950},
{name:'Brahmastra', year: 2021 , place: 'Delhi' , mode:'Theatre' , rating: 7.5, amount: 435},
{name:'Varisu', year: 2023 , place: 'Coimbatore' , mode:'Theatre' , rating: 9, amount: 990},
{name:'Big Bang', year: 2019 , place: 'Delhi' , mode:'Netlix' , rating: 7.5},
{name:'Game of Thrones', year: 2018 , place: 'Surat' , mode:'Netflix' , rating: 8.7},
{name:'Vikram', year: 2022 , place: 'Coimbatore' , mode:'Theatre' , rating: 9.1, amount: 750}])
#Right click to paste from notepad to cmd. 'cls' to clear all entries in cmd. 

#Show the content in the collection. Similar to select query.
db.movies.find()

#Show only top 3 
db.movies.find().limit(3)

#Show only top 3 after skipping the top 2 
db.movies.find().limit(3).skip(2)

#Select movies similar to where = 
db.movies.find({place:'Coimbatore'})

#Select all except the value mentioned
db.movies.find({place:{$ne:'Coimbatore'}})

#gt is greater than | gte is greater than or = | lt is lesser than | lte is lesser than or equal to
db.movies.find({rating:{$gt:8.5}})
db.movies.find({year:{$lt:2022}})

#Select not in the list
db.movies.find({place:{$nin:['Chennai','Delhi']}})

#Select between 8 and 9
db.movies.find({rating:{$gt:8,$lt:9}})

#Select using AND operator
db.movies.find({$and:[{rating:{$gt:8}},{year:2022}]})

#Select using multiple AND operator | multiple conditions inside a list
db.movies.find({$and:[{place:{$ne:'Bangalore'}},{rating:{$gt:8}},{year:{$in:[2019,2022,2023]}},{mode:'Theatre'}]})

chennai rating> 8, delhi or cbe rating < 8.5
#Select using multiple AND and OR operator
db.movies.find({$or:[{$and:[{place:'Chennai'},{rating:{$gt:8}}]},{$and:[{place:{$in:['Coimbatore','Delhi']}},{rating:{$lt:8.5}}]}]})

#Connecting to the Mongo cloud from the local system by connecting through the mongo shell in the command line. 
#Provide the address in cmd and enter. All the collections created in cmd will be reflected in the browser. 
#Browser is the cloud. Cmd is the local. Browser is the server. Cmd is client.