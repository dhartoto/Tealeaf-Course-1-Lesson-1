num_array = [1,2,3,4,5,6,7,8,9,10]
=begin
# Q.1.
num_array.each { |x| puts x }

# Q.2.
num_array.each { |x| puts x if x > 5 }

# Q.3.
new_array = num_array.select{|x| x % 3 == 0}
puts new_array

# Q.4.
num_array << 11
num_array.unshift(0)
puts num_array

# Q.5.
num_array.pop
num_array << 3
puts num_array

# Q.6.
num_array.uniq!
puts num_array

# Q.7.
Objects within an array are access via an index whereas 
hashes are accessed by keys.

# Q.8.
hash_one_eight = {:a => 1, :b => 2, :c => 3}
hash_one_nine = {a: 1, b: 2, c: 3}
=end
# Q.9.
h = {a: 1, b: 2, c: 3, d: 4}
puts h[:b]

# Q.10.
h[:e] = 5
puts h

# Q.13.
h.delete_if { |a,b| b < 3.5 }

# Q.14.
# Yes, has values can be arrays and vice versa
array = [1,2,3, {a: 1, b: 2, c: 3}]
hash = {a: 1, b: 2, c: [1,2,3,4,5,6]}

#Q.15.
