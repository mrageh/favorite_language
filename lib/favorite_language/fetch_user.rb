require "octokit"
require "pry"

module FavoriteLanguage
  class FetchUser
    attr_reader :user_name

    def initialize(user_name)
      @user_name = user_name
    end

    def language
      fav_lang_text
    end

    private
    attr_reader :repos, :error_message

    def valid_user_name?
      @repos ||= Octokit::Client.new.repositories(user_name)
    rescue Octokit::NotFound => e
      @error_message =  "#{user_name} not found"
      false
    end

    def num_of_repos_per_language
      repos.each_with_object(Hash.new(0)) do |repo, acc|
        acc[repo["language"]] += 1
      end
    end

    def favorite_language
      max = num_of_repos_per_language.values.max
      num_of_repos_per_language.select do |lang, num|
        num == max
      end.keys.first
    end

    def fav_lang_text
      if valid_user_name?
        pluralized_user_name = [user_name, "'s"].join
        [pluralized_user_name, "favorite programming language is", favorite_language].join(' ')
      else
        return error_message
      end
    end
  end
end
