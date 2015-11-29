path="."

dir=Dir.open(path)

files=[]

while name = dir.read
  next if name == '.'
  next if name == '..'
  files.push File.expand_path(name)
end

files.each do |f|
  puts File.basename(f)
  puts "----------------------------"
  IO.foreach f do |l|
    puts l
  end
  puts "----------------------------"
end
