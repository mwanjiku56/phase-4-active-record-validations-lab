class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
  validate :clickbait
    CLICKBAIT_TITLE = [
     /Won't Believe/i,
     /Secret/i,
     /Top/i,
     /Guess/i

 ] 

 def clickbait
    if CLICKBAIT_TITLE.none? {|word| word.match title}
     errors.add(:title, "Invalid title")
    end
 end
end
