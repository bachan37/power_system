

# power_system

Demo app to parse the excel file.

## Installation
```
cp config/databaase.yml.example config/database.yml
cp .ruby-version.example .ruby-version
cp .ruby-gemset.example .ruby-gemset
cd ../power_system
bundle install
rake db:migrate
RAILS_ENV=production/staging/development rake import:data
```

# Development

