class Song < ApplicationRecord
	validates_presence_of :name,:link,:user
	validates_format_of :link, :with => URI::regexp(%w(http https))
end

