require_relative "git-pull-request/version"
require 'cgi'

module Git
  module PullRequest
    extend self
    def request!
      branch = get_branch_name
      abort unless $?.success?
      
      root_url = "https://www.github.com/#{repo_url}/compare/"
      compared_branches = "master...#{CGI.escape(branch.strip)}"
      options = [
        ["pull_request[title]", pr_title], 
        ["pull_request[body]", "Please give a description"]
      ].map{|pair| 
          pair.map{ |el| CGI.escape(el) }.join("=") 
        }.join("&")

      system("open", "#{root_url}#{compared_branches}?#{options}")
    end

    private

    def get_branch_name
       @branch_name ||= `git rev-parse --abbrev-ref HEAD`
    end

    def repo_url
      @repo_url ||= `git config --get remote.origin.url`
        .sub(/.*github\.com[\/:]/,'').sub(/\.git$/,'').strip
    end

    def pr_title
      get_branch_name.gsub(/[^\w]+/, " ").strip.capitalize
    end

  end
end
