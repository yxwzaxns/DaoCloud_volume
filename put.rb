path="./tmp/"
content=Hash.new
dir=Dir.entries(path)
files=[]
Dir.chdir(path)
dir.each do |f|
  if File.exist?(File.expand_path(f)) && File.directory?(f) != true

    files.push File.expand_path(f)
  end
end
files.each do |f|
    item=Array('')
    IO.foreach f do |l|
      item.push l
    end
    content[f]=item
end
