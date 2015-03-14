require 'spec_helper'

describe CyrusParser::RecordSanitizer do

  describe '#format' do
  	context 'pipe-delimited input' do
  		it 'formats a record correctly' do
  			input = 'Smith | Steve | D | M | Red | 3-3-1985'
  			string = CyrusParser::RecordSanitizer.new(input)
  			string.format.should == 'Smith Steve Male 3/3/1985 Red'
  		end
  	end

  	context 'comma-delimited input' do
  		it 'formats a record correctly' do
  			input = 'Abercrombie, Neil, Male, Tan, 2/13/1943'
  			string = CyrusParser::RecordSanitizer.new(input)
  			string.format.should == 'Abercrombie Neil Male 2/13/1943 Tan'
  		end
  	end

  	context 'space-delimited input' do
  		it 'formats a record correctly' do
  			input = 'Kournikova Anna F F 6-3-1975 Red'
  			string = CyrusParser::RecordSanitizer.new(input)
  			string.format.should == 'Kournikova Anna Female 6/3/1975 Red'
  		end
  	end
  end

	describe '#format_date' do
		it "changes hyphens to slashes" do
			input = "Kournikova Anna F F 6-3-1975 Red"
			string = CyrusParser::RecordSanitizer.new(input)
			string.format_date.should == "Kournikova Anna F F 6/3/1975 Red" 
		end

		it "keeps slashes unaltered" do
			input = "Abercrombie Neil Male Tan 2/13/1943"
			string = CyrusParser::RecordSanitizer.new(input)
			string.format_date.should == input
		end
	end

	describe '#remove_middle_initial' do
		it "does not remove anything when the middle initial was never in the record" do
			input = "Abercrombie Neil Male Tan 2/13/1943"
			string = CyrusParser::RecordSanitizer.new(input)
			string.remove_middle_initial.should == input
		end

		it "removes the middle initial when it exists in the record" do
			input = "Kournikova Anna F F 6-3-1975 Red"
			string = CyrusParser::RecordSanitizer.new(input)
			string.remove_middle_initial.should == "Kournikova Anna F 6-3-1975 Red"
		end
	end

	describe '#remove_delimiters' do
		context 'when delimiters are pipes' do
			it "removes pipes" do
				input = "Smith | Steve | D | M | Red | 3-3-1985"
				string = CyrusParser::RecordSanitizer.new(input)
				string.remove_delimiters.should == "Smith Steve D M Red 3-3-1985"
			end
		end

		context 'when delimiters are commas' do
			it "removes commas" do
				input = "Abercrombie, Neil, Male, Tan, 2/13/1943"
				string = CyrusParser::RecordSanitizer.new(input)
				string.remove_delimiters.should == "Abercrombie Neil Male Tan 2/13/1943"
			end
		end

		context 'when delimiters are spaces' do
			it "does not alter the input" do
				input = "Kournikova Anna F F 6-3-1975 Red"
				string = CyrusParser::RecordSanitizer.new(input)
				string.remove_delimiters.should == input
			end
		end

		context 'when delimiters are anything else' do
			it "does not alter the input" do
				input = "Kournikova & Anna & F & F & 6-3-1975 & Red"
				string = CyrusParser::RecordSanitizer.new(input)
				string.remove_delimiters.should == input
			end
		end
	end

	describe '#order_fields' do
		it 'puts dob second-to-last if it is last' do
			input = 'Smith Steve M Red 3/3/1985'
  		string = CyrusParser::RecordSanitizer.new(input)
  		string.order_fields.should == 'Smith Steve M 3/3/1985 Red'
		end

		it 'leaves fields unaltered if dob is already second-to-last last' do
			input = 'Kournikova Anna F 6/3/1975 Red'
  		string = CyrusParser::RecordSanitizer.new(input)
  		string.order_fields.should == input 
		end
	end

	describe '#unabbreviate_gender' do
		it 'unabbreviates if gender is initial' do
			input = 'Kournikova Anna F 6/3/1975 Red'
  		string = CyrusParser::RecordSanitizer.new(input)
  		string.unabbreviate_gender.should == 'Kournikova Anna Female 6/3/1975 Red'
		end

		it 'leaves unaltered if gender is full word' do
			input = 'Abercrombie Neil Male 2/13/1943 Tan'
  		string = CyrusParser::RecordSanitizer.new(input)
  		string.unabbreviate_gender.should == input
		end
	end
end