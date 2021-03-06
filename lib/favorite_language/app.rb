require "thor"

module FavoriteLanguage
  class App < Thor

    desc "fetch USERNAME", "USERNAME favorite language from github"
    def fetch(user_name)
      $stdout.puts FavoriteLanguage::FetchUser.new(user_name.chomp).language
    end
  end
end
