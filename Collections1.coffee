#Select all features except id by giving _id:0
#First curly is a filtering criteria , second curly is a selection criteria
db.movies.find({}, {_id:0})

db.movies.find({$or:[{$and:[{place:'Chennai'},{rating:{$gt:8}}]},{$and:[{place:{$in:['Coimbatore','Delhi']}},{rating:{$lt:8.5}}]}]},{_id:0})

db.movies.find({year:2023},{name:1,rating:1})

#id is sytem generated so id will be shown by default unless it is written off explicitly
db.movies.find({year:2023},{_id:0,name:1,rating:1})

#Either mention the ones to be excluded or the ones to be included | 1 or 0 for user defined features
db.movies.find({year:2023},{_id:0, name:0,rating:0})

#Wrong | Can't mix 1 and 0
db.movies.find({year:2023},{_id:0, name:0,rating:1})

#Correct
db.movies.find({},{name:1, rating:1, place:1, year:1})

#Updating a value in a feature | if the feature doesn't exist, it will create a new one
db.movies.update({name:'Thor'},{$set:{amount:664}})

#Updating multiple values
db.movies.updateMany({year:2023},{$set:{rating:0}})
