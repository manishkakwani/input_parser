module CyrusParser
	class RecordSanitizer
		def initialize(record)
			@record = record
		end

		def format
			format_date
			remove_delimiters
			remove_middle_initial
			order_fields
			unabbreviate_gender
		end

		def format_date
			@record = @record.gsub("-", "/")
		end

    def remove_delimiters
     	@record = @record.gsub(/(\| )?,?/, "")
    end

		def remove_middle_initial
			arr = split_record
    	arr.size == 6 ? arr.slice!(2) : arr
	    @record = join_record(arr)
		end

		def order_fields
			arr = split_record
			arr.last.include?("/") ? (arr[-1], arr[-2] = arr[-2], arr[-1]) : arr
			@record = join_record(arr)
		end

		def unabbreviate_gender
			arr = split_record
			arr[2].include?('M') ? arr[2] = 'Male' : arr[2] = 'Female'
			@record = join_record(arr)
		end 
  
	  private

			def split_record
				@record.split
			end

			def join_record(array)
				array.join(" ")
			end
	end
end