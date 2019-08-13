class Post < ApplicationRecord
belongs_to :blogger
belongs_to :destination
	# - A post should have a title
	# - A post should have content longer than 100 characters
end
