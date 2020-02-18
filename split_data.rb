#!/usr/bin/ruby

fin = File.open(ARGV[0], "r")
fo = File.open("foo.out", "w")

fin.readlines.each do |line|

if fname_match=line.match(/^<([^>]+)>\r\n$/)
	fo.close
	puts "Output file: #{fname_match[1]}"
	fo = File.open("tsvs/#{fname_match[1]}.tsv", "w")
elsif line =~ /^\s/
else
	fo.puts(line.chomp)
end

end #line

fo.close
fin.close
