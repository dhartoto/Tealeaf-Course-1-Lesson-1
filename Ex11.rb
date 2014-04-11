
# 1. SAFER PICTURE DOWNLOAD

# Move to this directory
Dir.chdir '/Users/rottenapple/Desktop/Ruby/Pics2'

# First we find all of the pictures to be moved.
# Note that this deletes the file from the previous location.
pic_names = Dir['/Users/rottenapple/Desktop/Ruby/Pics/*.jpg']

puts 'What would you like to call this batch?'
batch_name = gets.chomp

puts
print "Downloading #{pic_names.length} files:  "
# This will be our counter. We'll start at 1 today, 
# though normally I like to count from 0.
pic_number = 1
pic_names.each do |name|
  print '.' # This is our "progress bar".

  new_name = 
    if pic_number < 10 
      "#{batch_name}0#{pic_number}.jpg"
    else
      "#{batch_name}#{pic_number}.jpg" 
    end

# Added safety feature so that existing file does not get overwritten
  while File.exist? new_name
    puts "A file called #{new_name} already exist."
    puts "To overwrite enter [1] to skip to the next increment enter [2]."
    resp = gets.chomp

    if resp == '1'
      File.rename name, new_name
      break

    elsif resp == '2'
      pic_number += 1
      new_name = 
        if pic_number < 10 
          "#{batch_name}0#{pic_number}.jpg"
        else
          "#{batch_name}#{pic_number}.jpg" 
        end

    else
      puts 'Please enter either [1] or [2].'
      next

    end
  end
  # If no file of the new_name exist then rename.
  File.rename name, new_name
  #  Finally, we increment the counter.
  pic_number += 1
end
puts # This is so we aren't on progress bar line. 
puts 'Completed!'


# 2. BUILD YOUR OWN PLAYLIST

music_files = Dir['/Users/rottenapple/Desktop/Ruby/Music/*.mp3']

playlist_file = 'playlist.m3u'

# Note: for m3u to work each song has to be on seperate lines.
File.open playlist_file, 'w' do |f|
  music_files.each do |mp3|
    f.write mp3 + "\n"
  end
end

puts File.read playlist_file

# 3. BUILD A BETTER PLAYLIST

music_files = Dir['/Users/rottenapple/Desktop/Ruby/Music/*.mp3']
rand_files = []

while music_files != []
  rand_files << music_files.shuffle!.pop
end

playlist_file = 'playlist.m3u'

# Note: for m3u to work each song has to be on seperate lines.
File.open playlist_file, 'w' do |f|
  rand_files.each do |mp3|
    f.write mp3 + "\n"
  end
end

puts File.read playlist_file