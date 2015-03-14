module CyrusParser
	class InputSorter
		require_relative 'record_sanitizer'
		require 'date'

		def initialize(records)
			@records = records
		end

		def format_records
			@records.map! { |r| CyrusParser::RecordSanitizer.new(r).format }
		end

		def sort_by_gender_then_last_name_ascending
			@records.sort_by { |r| [ r.split[2], r.split[0] ] }
		end

		def sort_by_dob_ascending
			#ties are broken by last name, as per the sample output
			@records.sort_by do |r|
				[ Date.strptime(r.split[-2], "%m/%d/%Y"), r.split[0] ]
			end
		end

		def sort_by_last_name_descending
			@records.sort.reverse
		end
	end
end