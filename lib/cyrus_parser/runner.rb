module CyrusParser
	class Runner
		require_relative 'input_sorter'

		def initialize
			import_files
			setup_output_file
		end

		def import_files
			@files = []
		  get_file_paths.each { |p| @files << IO.read(p).split("\n") }
		  @files.flatten!
		end

		def get_file_paths
			[File.expand_path('../../files/pipe.txt'),
			 File.expand_path('../../files/comma.txt'),
			 File.expand_path('../../files/space.txt')]
		end

		def setup_output_file
			@output_file = File.new('../../files/output.txt', 'w+')
		end

		def run
			format_records
			write_first_output
			write_second_output
			write_third_output
			close_output_file
		end

		private 

			def write_first_output
				write_title_to_output_file(1)
				output1 = sort_by_gender_then_last_name_ascending
				write_records_to_output_file(output1)
				write_newline_to_output_file
			end

			def write_second_output
				write_title_to_output_file(2)
				output2 = sort_by_dob_ascending
				write_records_to_output_file(output2)
				write_newline_to_output_file
			end

			def write_third_output
				write_title_to_output_file(3)
				output3 = sort_by_last_name_descending
				write_records_to_output_file(output3)
			end

	    def format_records
	    	@files = CyrusParser::InputSorter.new(@files).format_records
	    end

	    def sort_by_gender_then_last_name_ascending
	    	CyrusParser::InputSorter.new(@files).sort_by_gender_then_last_name_ascending
	    end

	    def sort_by_dob_ascending
	      CyrusParser::InputSorter.new(@files).sort_by_dob_ascending
	    end
	    
	    def sort_by_last_name_descending
	    	CyrusParser::InputSorter.new(@files).sort_by_last_name_descending
	    end
	    
			def write_title_to_output_file(i)
				@output_file.write("Output #{i}:\n")
			end

			def write_newline_to_output_file
				@output_file.write("\n")
			end

			def write_records_to_output_file(records)
				records.each { |r| @output_file.write("#{r}\n") }
			end

			def close_output_file
				@output_file.close
			end
	end
end