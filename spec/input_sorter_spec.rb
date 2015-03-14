require 'spec_helper'

describe CyrusParser::InputSorter do
 
  let(:input1) do
		["Smith Steve Male 3/3/1985 Red",
    "Bonk Radek Male 6/3/1975 Green",
		"Bouillon Francis Male 6/3/1975 Blue"]
	end

  let(:input2) do
  	["Abercrombie Neil Male 2/13/1943 Tan",
  	"Bishop Timothy Male 4/23/1967 Yellow",
    "Last First Female 1/1/1990 Blue",
  	"Kelly Sue Female 7/12/1959 Pink"]
  end

  let(:input3) do
  	["Kournikova Anna Female 6/3/1975 Red",
  	 "Hingis Martina Female 4/2/1979 Green",
  	 "Seles Monica Female 12/2/1973 Black"]
  end

  describe '#sort_by_gender_then_last_name_ascending' do
  	it 'input1: sorts_by_gender_then_last_name_ascending' do
		  records = CyrusParser::InputSorter.new(input1)
		  records.sort_by_gender_then_last_name_ascending.should == [
		    "Bonk Radek Male 6/3/1975 Green",
				"Bouillon Francis Male 6/3/1975 Blue",
				"Smith Steve Male 3/3/1985 Red"
		  ]
		end
		  
  	it 'input2: sorts_by_gender_then_last_name_ascending' do
		  records = CyrusParser::InputSorter.new(input2)
		  records.sort_by_gender_then_last_name_ascending.should == [
		  	"Kelly Sue Female 7/12/1959 Pink",
        "Last First Female 1/1/1990 Blue",
		  	"Abercrombie Neil Male 2/13/1943 Tan",
		  	"Bishop Timothy Male 4/23/1967 Yellow"
		  ]
		end

  	it 'input3: sorts_by_gender_then_last_name_ascending' do
		  records = CyrusParser::InputSorter.new(input3)
		  records.sort_by_gender_then_last_name_ascending.should == [
	  	  "Hingis Martina Female 4/2/1979 Green",
	  	  "Kournikova Anna Female 6/3/1975 Red",
	  	  "Seles Monica Female 12/2/1973 Black"
		  ]
  	end
  end

  describe '#sort_by_last_name_descending' do
  	it 'input1: sorts_by_last_name_descending' do
		  records = CyrusParser::InputSorter.new(input1)
		  records.sort_by_last_name_descending.should == [
				"Smith Steve Male 3/3/1985 Red",
				"Bouillon Francis Male 6/3/1975 Blue",
		    "Bonk Radek Male 6/3/1975 Green"
		  ]
		end
		  
  	it 'input2: sorts_by_last_name_descending' do
		  records = CyrusParser::InputSorter.new(input2)
		  records.sort_by_last_name_descending.should == [
        "Last First Female 1/1/1990 Blue",
		  	"Kelly Sue Female 7/12/1959 Pink",
		  	"Bishop Timothy Male 4/23/1967 Yellow",
		  	"Abercrombie Neil Male 2/13/1943 Tan"
		  ]
		end

  	it 'input3: sorts_by_last_name_descending' do
		  records = CyrusParser::InputSorter.new(input3)
		  records.sort_by_last_name_descending.should == [
	  	  "Seles Monica Female 12/2/1973 Black",
	  	  "Kournikova Anna Female 6/3/1975 Red",
	  	  "Hingis Martina Female 4/2/1979 Green"
		  ]
  	end
  end

  describe '#sort_by_dob_ascending' do
  	it 'input1: sorts_by_dob_ascending' do
		  records = CyrusParser::InputSorter.new(input1)
		  records.sort_by_dob_ascending.should == [
		    "Bonk Radek Male 6/3/1975 Green",
				"Bouillon Francis Male 6/3/1975 Blue",
				"Smith Steve Male 3/3/1985 Red"
		  ]
		end
		  
  	it 'input2: sorts_by_dob_ascending' do
		  records = CyrusParser::InputSorter.new(input2)
		  records.sort_by_dob_ascending.should == [
		  	"Abercrombie Neil Male 2/13/1943 Tan",
		  	"Kelly Sue Female 7/12/1959 Pink",
		  	"Bishop Timothy Male 4/23/1967 Yellow",
        "Last First Female 1/1/1990 Blue"
		  ]
		end

  	it 'input3: sorts_by_dob_ascending' do
		  records = CyrusParser::InputSorter.new(input3)
		  records.sort_by_dob_ascending.should == [
	  	  "Seles Monica Female 12/2/1973 Black",
	  	  "Kournikova Anna Female 6/3/1975 Red",
	  	  "Hingis Martina Female 4/2/1979 Green"
		  ]
  	end
  end
end
