# == Schema Information
#
# Table name: users
#
#  id                    :bigint           not null, primary key
#  email                 :string           not null
#  username              :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  political_affiliation :string           not null
#  age                   :integer          not null
#

#bundle exec annotate --models 
  #gives us a copy of the schema for the corresponding model 

#model names will be the singular version of the table name 
#no require_relative: RAILS does things for us 
#don't require things 

#ApplicationRecord gives us getters and setters for each column; we don't need to write them 

class User < ApplicationRecord 
  #validations give us nice and readable errors messages e.g. fake_ryan.errors.full_messages 
  validates :username, :email, presence: true, uniqueness: true 
  validates :age, :political_affiliation, presence: true 

  has_many :chirps, #pick good names 
    primary_key: :id, 
    foreign_key: :author_id, #from the other class 
    class_name: 'Chirp' #symbol or string 

  has_many :likes, 
    primary_key: :id, 
    foreign_key: :liker_id,
    class_name: :Like 

  has_many :liked_chirps, #find liked chirps 
    through: :likes, 
    source: :chirp 
  #through and source go through associations 


  #ActiveRecord finder methods allows you  to find one instance of things.  Returns first record that it  finds
  User.first 
  User.last
  User.find(5) #User.find(<id>) takes in a id key as an argument and will raise error message if not found
  User.find_by(username: "charlos_gets_buckets") #User.find_by(key(column): <value>) and returns nil if not found

  # all data return will be a ruby object if it is found

  #Write a query to look for all the users between the ages of 10-20
  User.where("age >= 10 AND age <= 20")
  User.where("age >= (?) AND  age <= (?)",10,20)
  User.where(age: 10..20)
  User.where(age: 10...21)

  #Find all the users not younger than the age of 11
  #HINT: where not
  User.where.not("age < 11")

  #Find all the instructors from a list and order by ascending
  instructors = ["hawaiian_shirts_ftw","will_climb_rocks","give_me_wine"]
  User.where(username: instructors)
  User.where("username in (?)",instructors)
  
end 
