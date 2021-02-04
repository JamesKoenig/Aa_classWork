# == Schema Information
#
# Table name: chirps
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Chirp < ApplicationRecord 
  validates :body, presence: true 
  # validates :author_id, presence: true 
  #don't validate the presence of a foreign key if you have a belongs_to
  
  validate :body_too_long #runs custom validation: use the method name 

  def body_too_long 
    if body && body.length > 140 
      errors[:body] << 'TOO LONG!' #gives us an array 
    end
  end 

  belongs_to :author, #naming the association  bananable, but be semantic 
    primary_key: :id, #this is always the case 
    foreign_key: :author_id, #column_name from my own table 
    class_name: :User #the model it's associated with 
  #auto validates presence of foreign key 

  # belongs_to(:author, {primary_key: :id, foreign_key: :author_id, class_name: :User})

  has_many :likes, 
    primary_key: :id, 
    foreign_key: :chirp_id, 
    class_name: :Like 

  has_many :likers, #name we choose 
    through: :likes,
    source: :liker #this is association in the Like model

  #ALL has_many :throughs must be below any associations that they use 

  # Find all the chirps authored by the user, "will_climb_rocks"
  # Chirp.joins(:author).where(users: {username: "will_climb_rocks"})
  # Chirp.joins(:author).where("users.username = 'will_climb_rocks' ")
  # # joins calls an ASSOCIATION, in our where we have to specify what table we want to filter. 
  # # users is the table and username is a column in users table

  # # Find all of the chirps liked by users that are politically affiliated with Javascript
  # Chirp.joins(:likers).where("users.political_affiliation = 'JavaScript' ")

  # # Find the chirps that have no likes
  # Chirp.left_outer_joins(:likes).where(likes: {id: nil})
  # # Find the number of likes each chirp has
  # Chirp.select(:id,:body,"count(*) as num_likes").joins(:likes).group(:id)
  # # Find chirps with at least 3 likes
  # Chirp.select(:id,:body,"count(*) as num_likes").joins(:likes).group(:id).having("count(*) >= 3")
  # Chirp.joins(:likes).group(:id).having("count(*) >= 3").pluck(:body)
  # # Find all the chirps created by someone of age 11 that were also liked by someone of age 11
  # Chirp.joins(:likers,:author).where(users: {age: 11}).where(authors_chirps: {age: 11})
  # active record will alias the users table in the second joins 


   # Includes #

    # def self.see_chirp_authors_n_plus_one
    #     # the "+1"
    #     chirps = Chirp.all

    #     # the "N"
    #     chirps.each do |chirp|
    #         puts chirp.author.username
    #     end

    # end

    # def self.see_chirps_optimized
    #     # pre-fetches data
    #     chirps = Chirp.includes(:author).all

    #     chirps.each do |chirp| 
    #     # uses pre-fetched data 
    #         puts chirp.author.username
    #     end
    # end

    # Joins #

    # def self.see_chirp_num_likes_n_plus_one
    #     chirps = Chirp.all

    #     chirps.each do |chirp|
    #         puts chirp.likes.length
    #     end
    # end

    # def self.see_chirp_num_likes_optimized
    #     chirps_with_likes = Chirp
    #         .select("chirps.*, COUNT(*) AS num_likes")
    #         .joins(:likes)
    #         .group(:id)
    
    #     chirps_with_likes.each do |chirp|
    #         puts chirp.num_likes
    #     end
    # end

end 
