
# 1. One billion seconds!
OBS = Time.local(1979, 9, 18, 9, 0) + 10**9
puts OBS

# Happy birthday
puts "What year were you born in?"
year = gets.chomp

puts "Which month of #{year}? Please provide a number i.e. 1 for Jan"
month = gets.chomp

puts "Now we also need to know the day please. Also as an integer..."
day = gets.chomp

birth_date = Time.local(year.to_i, month.to_i, day.to_i)
current_date = Time.new
age = (current_date - birth_date)/365/24/60/60
puts "You are #{age.to_i} years old."
puts "Spank!" * age.to_i

# 2. PARTY LIKE IT'S ROMAN_TO_INTEGER MCMXCIX
rom_hash = { M: 1000, D: 500, C: 100, L: 50, X: 10, V: 5, I: 1 }

puts "Enter roman numerals and I'll convert it to an integer"
rom = gets.chomp

rom_arr = rom.split('')
int_arr = []                                      # [1000, 100, 1000, 10, 100, 1, 10]

rom_arr.each {|r| int_arr << rom_hash[r.to_sym]}  # [10, 1, 100, 10, 1000, 100, 1000]
int_arr.reverse!

total = int_arr[0]
index1 = 0
index2 = 1
arr_len = int_arr.length - 1

while index2 <= arr_len
  if int_arr[index1] <= int_arr[index2]
    total += int_arr[index2]
    index1 += 1
    index2 += 1
  else
    total -= int_arr[index2]
    index1 += 1
    index2 += 1
  end
end

puts total

# 3. BIRTHDAY HELPER
require 'yaml'
# This part was to create a file in th current folder.
=begin
cal = { 'Christopher Alexander' =>  'Oct  4, 1936',
        'Christopher Lambert' =>    'Mar 29, 1957',
        'Christopher Lee' =>        'May 27, 1922',
        'Christopher Lloyd' =>      'Oct 22, 1938',
        'Christopher Pine' =>       'Aug  3, 1976',
        'Christopher Plummer' =>    'Dec 13, 1927',
        'Christopher Walken' =>     'Mar 31, 1943',
        'The King of Spain' =>      'Jan  5, 1938'}

filename = 'birth_cal.txt'

File.open filename, 'w' do |f|
  f.write cal.to_yaml
end
=end

filename = 'birth_cal.txt'
content = File.read filename
yaml_obj = YAML:: load content

puts "Please enter the full name of the following people to retrieve their birthday & age"
puts yaml_obj.each { |name, date| puts name }
resp = gets.chomp

if yaml_obj.include?(resp)
  puts yaml_obj[resp]
else
  puts "I don't recognise that name"
end
