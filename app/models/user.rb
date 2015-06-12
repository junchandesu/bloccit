class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

   has_many :posts
   has_many :comments
   has_many :votes, dependent: :destroy
   has_many :favorites, dependent: :destroy
   mount_uploader :avatar, AvatarUploader
  # mount_uploader :picture, ImageUploader
   def admin?
     role == 'admin'
  end
 
  def moderator?
     role == 'moderator'
  end
 
 def favorited(post)
    favorites.where(post_id: post.id).first
 end

  def voted(post)
    votes.where(post_id: post.id).first 
  end
  
  def self.top_rated
    self.select('users.*') #select all attributes of the user
        .select('COUNT(DISTINCT comments.id) AS comments_count') #count the comments made by the user
        .select('COUNT(DISTINCT posts.id) AS posts_count') #count the posts made by the user
        .select('COUNT(DISTINCT comments.id) + COUNT(DISTINCT posts.id) AS rank') # Add the comment count to the posts count and label the sum as "rank"
        .joins(:posts) #Ties the posts table to the users table, via user_id
        .joins(:comments) #Ties the comments table to the users table via user_id
        .group('users.id') #Instructs the database to group the results so that each user will be returned in a distinct row
        .order('rank DESC') #Instructs the

  end
end