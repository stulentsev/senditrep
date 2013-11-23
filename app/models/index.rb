# TODO: This name smells of trouble. Should we rename it to PostalCode?
class Index < ActiveRecord::Base
	belongs_to :city
end
