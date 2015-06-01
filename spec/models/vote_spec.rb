require 'rails_helper'

describe Vote  do 

	describe "Validations" do
		describe "value validation" do
			it "only allows -1 or 1 as values" do

				one = Vote.create(value: 1)
				expect(one.valid?).to eql(true)
				
				minus_one = Vote.create(value: -1)
				expect(minus_one.valid?).to eql(true)

				two = Vote.create(value: 2)
				expect(two.valid?).to eql(false)

			end
		end

	end

	
end