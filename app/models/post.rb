# class ClickbaitValidator < ActiveModel::EachValidator
#     def validate_each(record, attribute, value)
#         unless value =~ /Won't Believe|Secret|Top \d+|Guess/
#             record.errors.add attribute, (options[:message] || "Clickbait title needed.")
#         end
#     end
# end


class Post < ActiveRecord::Base
    validate :clickbait
    validates :title, presence: true
    validates :content, length: { minimum: 250 } 
    validates :summary, length: {maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)} #must be capitalized 

    def clickbait
        unless title =~ /Won't Believe|Secret|Top \d+|Guess/
            errors.add(:title, "Clickbait Words Needed.")
        end
    end
end
