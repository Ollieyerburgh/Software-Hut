# team-18
---

### Description
Describe your app here...

### Significant Features/Technology
The system has the following:

* Some significant thing...
* Another one...

### Special Development Pre-requisites
None.

### Deployment
*QA -> Demo -> Production* using the `epi-deploy` gem.

### Customer Contact
Some Customer <some.customer@epigenesys.co.uk>

TEST THE SLACK NOTIFICATIONS

1. Preparing your project
Before you can deploy to your demo site, you need to change the following files in your project:

config/deploy.rb

Update the following lines:

set :repo_url,    'git@git.shefcompsci.org.uk:com3420-2017-18/team18/project.git'
set :application, 'team18'
config/deploy/demo.rb

## Application deployment configuration
set :server,      'epi-stu-hut-demo3.shef.ac.uk'
set :user,        'demo.team18'
set :deploy_to,   -> { "/srv/services/#{fetch(:user)}" }
set :log_level,   :debug

## Server configuration
server fetch(:server), user: fetch(:user), roles: %w{web app db}

## Additional tasks
namespace :deploy do
  task :seed do
    on primary :db do within current_path do with rails_env: fetch(:stage) do
      execute :rake, 'db:seed'
    end end end
  end
end
Configuring Errbit
When an application is running on the demo server, it is not feasible to open a console and observe for errors that happen when users use your application. We use a tool called Errbit which allows us to track errors that happen in a deployed application and report them back to the developers so they can be fixed. A gem called Airbrake handles sending errors from your Rails application to Errbit, and this is included in the Rails template.

Visit https://errbit.hut.shefcompsci.org.uk/ and click on your team name (Project - Team 18). Your API key is displayed at the top of the page. Please copy your API key then create the following file, replacing REPLACE_ME with your API key:

config/initializers/errbit.rb

Airbrake.configure do |config|
  config.api_key = 'REPLACE_ME'
  config.host    = 'errbit.hut.shefcompsci.org.uk'
  config.port    = 443
  config.secure  = config.port == 443
end
2. Commit any changes
Before deploying to your demo site, ensure you have committed any changes to your master branch.

# Add any untracked files to the next commit
git add -A

# Commit to your repository, replacing {message} with a relevant commit message
git commit . -m "{message}"

# Push your changes to your team repository
git push -u origin master
3. Deploying your project
Your project uses the epiDeploy gem to tag the release and then invoke Capistrano to deploy your project to your team demo site.

Please note:
If you are using macOS, you will need to add your SSH key to the Keychain by running ssh-add -K ~/.ssh/id_rsa before deploying.
epiDeploy will warn you if you have uncommitted changes, so make sure to follow the steps above before deploying to the demo site.

# Tag a release and deploy to the demo site
bundle exec ed release -d demo
The deployment process takes a few minutes to complete. If it fails for any reason, you will be alerted to this.

3.1. Seeding your project
If you need to seed some initial data onto your site, you can run the following command once deployment has completed successfully:

bundle exec cap demo deploy:seed
4. Seed your database
Aside from any migrations that create tables, the database for your deployed application will initially be empty. This is unlikely to be desired, as you might want an initial administrative user to be created so that you can log in and create further users.

If you have populated your db/seeds.rb file with initial database data, you can run the following command to seed your database on the demo server (you will typically only do this following your team’s first deployment):

bundle exec cap demo deploy:seed
