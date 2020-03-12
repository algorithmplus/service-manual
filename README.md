[![Build Status](https://dfe-ssp.visualstudio.com/S108-Get-Help-To-Retrain/_apis/build/status/DFE-Digital.get-help-to-retrain?branchName=master)](https://dfe-ssp.visualstudio.com/S108-Get-Help-To-Retrain/_build/latest?definitionId=182&branchName=master)
# DfE Service manual

## Prerequisites

- Ruby 2.6.5
- PostgreSQL
- NodeJS 12.14.x
- Yarn 1.16.x

## Setting up the app in development

1. Run `bundle install` to install the gem dependencies
2. Run `yarn` to install node dependencies
3. Run `bin/rails db:setup` to set up the database development and test schemas, and seed with test data
4. Run `bundle exec rails server` to launch the app on http://localhost:3000
5. Run `./bin/webpack-dev-server` in a separate shell for faster compilation of assets

## Running specs, linter(without auto correct) and annotate models and serializers
```
bundle exec rake
```

## Running specs
```
bundle exec rspec
```

## Linting

It's best to lint just your app directories and not those belonging to the framework, e.g.

```bash
bundle exec govuk-lint-ruby app config db lib spec Gemfile --format clang -a

or

bundle exec govuk-lint-sass app/webpacker/styles
```

## Security vulnerabilites scanner

Brakeman is a static analysis tool which checks Ruby on Rails applications for security vulnerabilities.

To get the report simply run:

```bash
  brakeman
```

or

```bash
  brakeman -o report.html
```
(if you want a report in a nicer format).

Please check https://brakemanscanner.org/docs/ for more details.


