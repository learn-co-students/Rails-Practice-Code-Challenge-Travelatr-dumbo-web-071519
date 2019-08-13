class Blogger < ApplicationRecord
has_many :posts
has_many :destinations, through: :posts
#- Bloggers should have unique names and ages above 0, and their bio should be over 30 characters long.
#- **BONUS** A list of that user's top 5 most written about destinations (the destinations with the most posts)
    
    def post_likes
        self.posts.map do |post|
            post.likes
        end
    end

    def total_likes
        self.post_likes.sum
    end

    def featured_post
        sorted_posts = self.posts.sort do |post|
            post.likes
        end

        sorted_posts.last
    end


end
