class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts, dependent: :destroy
         has_many :comments, through: :posts
         has_many :likes, through: :posts
         has_many :senders, class_name: 'Friendship' 
         has_many :receivers, class_name: 'Friendship'


         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :city, presence: true
         validates :state, presence: true
         validates :country, presence: true
         
         has_one_attached :image


    # def full_name
    #     "#{fname} #{lname}"
    # end



    # def friends_and_own_posts
    #   myfriends = friends
    #   our_posts = []
    #   myfriends.each do |f|
    #     f.posts.each do |p|
    #       our_posts << p
    #     end
    #   end
    #   posts.each do |p|
    #     our_posts << p
    #   end
    #   our_posts
    # end
         
       
       
end
