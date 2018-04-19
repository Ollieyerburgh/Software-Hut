class Search < ApplicationRecord
    
    scope :query, -> (search) {
        where("lower(description) LIKE ? OR lower(title) LIKE ? OR lower(address) LIKE ?", "%#{search.downcase}%","%#{search.downcase}%" ,"%#{search.downcase}%")
    }
    scope :subject, -> (subject) { where(subject: subject)}

end 