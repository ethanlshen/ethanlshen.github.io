#!/bin/bash
# Local development server for the portfolio site.
# Usage: ./serve.sh
#
# Requires Ruby 3.0+ and Bundler. If you don't have them:
#   brew install ruby
#   Then add brew ruby to your PATH (brew will print instructions).
#
# First run will install dependencies via Bundler.
# Then starts Jekyll at http://localhost:4000 with live reload.

set -e

RUBY_MAJOR=$(ruby -e 'puts RUBY_VERSION.split(".")[0].to_i' 2>/dev/null || echo 0)

if [ "$RUBY_MAJOR" -lt 3 ]; then
  echo "Ruby 3.0+ is required (found $(ruby --version 2>/dev/null || echo 'none'))."
  echo ""
  echo "Install via Homebrew:"
  echo "  brew install ruby"
  echo "  Then follow brew's instructions to add it to your PATH."
  exit 1
fi

if ! command -v bundle &> /dev/null; then
  echo "Installing Bundler..."
  gem install bundler
fi

if [ ! -f Gemfile.lock ]; then
  echo "Installing dependencies..."
  bundle install
fi

echo "Starting Jekyll at http://localhost:4000 ..."
bundle exec jekyll serve --livereload
