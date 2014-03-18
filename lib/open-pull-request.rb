require_relative "open-pull-request/version"
require_relative "open-pull-request/trello_details"
require 'cgi'
require 'optparse'
require 'ostruct'

module Open
  class PullRequest
    attr_reader :options
    def initialize
      @options = OpenStruct.new
    end

    def request!
      option_parser.parse!(ARGV)
      branch = get_branch_name
      abort unless $?.success?
      pr_description = "Please give a description"
      if options.trello_card_id
        developer_public_key = `git config trello.developer-public-key`.strip
        member_token = `git config trello.member-token`.strip
        trello_details = TrelloDetails.new(
          options.trello_card_id,
          developer_public_key,
          member_token
        )
        pr_description = trello_details.pull_request_description
      end
      root_url = "https://www.github.com/#{repo_url}/compare/"
      compared_branches = "master...#{CGI.escape(branch.strip)}"
      options = [
        ["pull_request[title]", pr_title],
        ["pull_request[body]", pr_description]
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

    def option_parser
      @option_parser ||= OptionParser.new do |op|

        op.on("-t", "--trello CARD_ID", "Trello card id to pull info from") do |v|
          options.trello_card_id = v
        end

      end
    end

  end
end
