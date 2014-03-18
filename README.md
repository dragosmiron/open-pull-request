# Open::PullRequest

A utility that allows you to open a *Pull Request* inside the browser.
For the moment all pull requests will be made against master branch.

## Installation

`$ gem install open-pull-request`

Optional:
Set-up the following in git config if you want Trello integration:
  * `git config trello.developer-public-key`
  * `git config trello.member-token`




## Usage

To use it go to a git repository on a separate branch than master and type
`git pr`

This will open a internet browser window with the comparison between the branch you are currently on and master.

If you want to populate the body of the pull-request with the Trello details, pass a `-t CARD_ID` parameter, with CARD_ID being the id of the Trello card

## Contributing

1. Fork it ( http://github.com/<my-github-username>/open-pull-request/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
