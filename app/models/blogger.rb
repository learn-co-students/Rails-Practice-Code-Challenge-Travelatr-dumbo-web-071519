class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, presence: true, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def number_of_posts
        self.posts.each_with_object({}){ |post, hash|
            !hash[post.destination.id] ? hash[post.destination.id] = 1 : hash[post.destination.id] += 1
        }.sort_by {|key, value| value}.reverse
    end

    def posts_on_destination(dest_id)
        self.posts.select{|post| post.destination_id == dest_id}
    end
end
