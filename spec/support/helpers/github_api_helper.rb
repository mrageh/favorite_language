require "json"
module GithubApiHelper
  def stub_request_adam
    file = File.read("spec/support/fixtures/repos.json")
    stub_request(:get, "https://api.github.com/users/Adam89/repos").
      with(:headers =>
          {
            'Accept'=>'application/vnd.github.v3+json',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type'=>'application/json',
            'User-Agent'=>'Octokit Ruby Gem 3.7.0'
          }).to_return(
            :status => 200,
            :body => JSON.parse(file),
            :headers => {}
          )
  end

  def stub_request_non_existant_user
    stub_request(:get, "https://api.github.com/users/non_existant/repos").
      with(:headers =>
          {
            'Accept'=>'application/vnd.github.v3+json',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type'=>'application/json',
            'User-Agent'=>'Octokit Ruby Gem 3.7.0'
          }).to_return(
            :status => 404,
            :body => [
              {
                message: "Not Found",
                documentation_url: "https://developer.github.com/v3"
              }
            ],
            :headers => {}
          )
  end

  def stub_request_polyglot
    file = File.read("spec/support/fixtures/repos_with_different_languages.json")
    stub_request(:get, "https://api.github.com/users/Adam89/repos").
      with(:headers =>
          {
            'Accept'=>'application/vnd.github.v3+json',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type'=>'application/json',
            'User-Agent'=>'Octokit Ruby Gem 3.7.0'
          }).to_return(
            :status => 200,
            :body => JSON.parse(file),
            :headers => {}
          )
  end

  def stub_request_null
    file = File.read("spec/support/fixtures/null_language_repos.json")
    stub_request(:get, "https://api.github.com/users/Adam89/repos").
      with(:headers =>
          {
            'Accept'=>'application/vnd.github.v3+json',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type'=>'application/json',
            'User-Agent'=>'Octokit Ruby Gem 3.7.0'
          }).to_return(
            :status => 200,
            :body => JSON.parse(file),
            :headers => {}
          )
  end
end
