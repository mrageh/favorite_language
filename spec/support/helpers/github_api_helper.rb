module GithubApiHelper
  def stub_request_adam
  stub_request(:get, "https://api.github.com/users/Adam89/repos").
    with(:headers =>
        {
          'Accept'=>'application/vnd.github.v3+json',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type'=>'application/json',
          'User-Agent'=>'Octokit Ruby Gem 3.7.0'
        }).to_return(
          :status => 200,
          :body => File.read("spec/support/fixtures/repos.json"),
          :headers => {}
        )
  end
end
