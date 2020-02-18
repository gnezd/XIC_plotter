#!/usr/bin/ruby

def integrate(st, en, arr)

riemann_sum=0.000
y_1=0.000
y_2=0.000
arr.each do |pt|
	if pt[0].to_f >= st
		y_1 = pt[1].to_f
	if pt[0].to_f <=en
		riemann_sum+=pt[1].to_f
		y_2 = pt[1].to_f
	else
		break
	end
	end
end
return riemann_sum-(y_1+y_2)*(en-st)/2

end

file_list = Array.new
arr = Array.new(27){Array.new(3)}


Dir.open("tsvs").children.each { |f| file_list.push("tsvs/#{f}") }

file_list.sort!

st_en=[[2.45,2.8]]*file_list.size #integration x range


(0..file_list.size-1).each do |n|
	data = Array.new
	tsv_in = File.open(file_list[n], "r")
	tsv_in.readlines.each do |line|
		data.push(line.split("\t"))
	end #line of tsv
	result = integrate(st_en[n][0],st_en[n][1],data)
	#puts "#{file_list[n]} integrate from #{st_en[n][0]} to #{st_en[n][1]}: #{result}"
	fname = file_list[n].split("tsvs/")[1].split(".tsv")[0]
	puts "#{fname}\t\t#{result}"
end #end fn


