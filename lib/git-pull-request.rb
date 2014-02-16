require_relative "git-pull-request/version"
require 'cgi'

module Git
	module PullRequest
    extend self
    def request!
      branch = get_branch_name
      abort unless $?.success?
      
      system("open https://www.github.com/#{repo_url}/compare/master...#{CGI.escape(branch.strip)}")
    end

    private

    def get_branch_name
    	 `git rev-parse --abbrev-ref HEAD`
    end

    def repo_url
      `git config --get remote.origin.url`
        .sub(/.*github\.com[\/:]/,'').sub(/\.git$/,'').strip
    end
	end
end
