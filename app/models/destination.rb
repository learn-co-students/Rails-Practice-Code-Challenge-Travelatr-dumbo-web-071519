class Destination < ApplicationRecord
has_many :posts
has_many :bloggers, through: :posts

    def top_five_posts
        if self.posts.length < 5
            return self.posts
        else
            return self.posts.last[5]
        end
    end

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

        def bloggers
        self.posts.map do |post|
            Blogger.find(post.blogger_id)
        end.uniq
    end

    def average_age
        sum_age = self.bloggers.map do |blogger|
            blogger.age
        end.sum
        sum_age/self.bloggers.count
    end
end
