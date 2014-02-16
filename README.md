# Open::PullRequest

A utility that allows you to open a *Pull Request* inside the browser.
For the moment all pull requests will be made against master branch.

## Installation

Add this line to your application's Gemfile:

    gem 'open-pull-request'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install open-pull-request

## Usage

To use it go to a git repository on a separate branch than master and type
`git pr`
This will open a internet browser window with the comparison betwwen the branch you are currently on and master.


## Contributing

1. Fork it ( http://github.com/<my-github-username>/open-pull-request/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
