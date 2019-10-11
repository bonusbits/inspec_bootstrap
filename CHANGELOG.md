# CHANGE LOG

## 2.0.1 - TODO List - Levon Becker
* Get jUnit test results working for rubocop rake task

## 2.0.0 - 10/11/2019 - Levon Becker
* Updated CircleCI 2.1
* Updated to ChefDK 4.3.13 bundle
    * Ruby 2.6.3
    * rubocop 0.72.0
* Renamed chef_client to chef to cover all Chef testing
* Wrapped logic with control syntax. Can now call specific controls and ignore inspec attributes.
* Added ChegDK version test and control
* Added stub attrs.yml
* Renamed some attributes so it's not backwards compatible hence the major version rev  
* Removed Windows support
* Added Inspec Version check to inspec.yml
* Updated os method calls to work with newer version and discover Amazon Linux correctly again

## 1.0.2 - 10/28/2017 - Levon Becker
* Added knife path discovery logic
* Switched CircleCI container to ChefDK 1.6.1
* Added Gemfile.lock to keep CircleCI in line
* Updated Gemfile to ChefDK 1.6.1 gems
* Updated the default Chef Client Chef version to 12.21.4

## 1.0.1 - 04/09/2017 - Levon Becker
* Switched to CircleCi 2.0
* Moved Gitter URL to bonusbits room. Doesn't really need a dedicated room.

## 1.0.0 - 04/03/2017 - Levon Becker
* Initial Release

---