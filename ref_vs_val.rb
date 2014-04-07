# Pass by reference vs value
hat_arr = ['top hat', 'beret', 'straw']

# Call a method that does not mutate the caller
def hats(arr)
  arr.select {|h| h == 'straw'}
end

hats(hat_arr)
puts hat_arr

# A method that does not mutate the caller within the method will 
# not change the array outside the method.

puts

# Call a method that  mutates the caller witin the method
def hats_mutate(arr)
  arr.select! {|h| h == 'straw'}
end



hats_mutate(hat_arr)
puts hat_arr

# A method that mutates the caller within the method will change the 
# array outside the method.