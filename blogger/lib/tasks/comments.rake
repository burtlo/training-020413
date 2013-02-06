namespace :comments do

  task :silent_clean => :environment do
  # task clean: :environment do
    Comment.all.each {|c| c.destroy }
  end

  desc "It cleans up all the comments"
  task :clean => :silent_clean do
    puts "All done cleaning"
  end

end