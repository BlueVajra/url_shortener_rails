class Url < ActiveRecord::Base
  validates :url, presence: {message: "URL can not be blank"}
  validates :url, format: {
    with: /(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?/ix,
    message: "The text you entered is not a valid URL"
  }
  #validates :short_url, presence: true
end