namespace :user do
  desc "Backfill total_karma"

  task :update_karma => :environment do
    system "rails c && User.all.each {|u| u.update_karma}"
    block task symbol block
  end

end
