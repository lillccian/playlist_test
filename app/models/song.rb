class Song < ApplicationRecord
	validates_presence_of :name,:link,:user
end
