# Even better profiling
=begin
def profile block_description, &block
  switch = false
  if switch
    start_time = Time.new
    block.call
    duration = Time.new - start_time
    puts "#{block_description}: #{duration} seconds"
  else
    block.call 
  end
end

profile 'count to a million' do 
  number = 0
  1000000.times do
    number = number + 1
  end 
end

# Grandfather clock
def grandfather_clock &dong
  chime = Time.new.hour
  chime.times do
    dong.call
  end
end

grandfather_clock do
  puts 'Dong'
end
=end

# Program logger
def log block_des, &block
  a = block.call
  puts "#{block_des} has started..."
  puts "#{block_des} has ended!"
  puts "It returned: #{a}"
end

log 'not much' do 
  log 'something' do
    puts 'monkey'
    2+2
  end
  6**32
end
