class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

   has_many :posts
<<<<<<< HEAD
   has_many :comments

=======
   #mount_uploader :avatar, AvatarUploader
   mount_uploader :picture, ImageUploader
>>>>>>> Uploading-images
 def admin?
   role == 'admin'
 end
 
 def moderator?
   role == 'moderator'
 end
 
end
