
## Set up for collaboration

This Git workflow involves creating a fork of the project on GitHub, setting up your local environment, 
and working within feature branches. You'll make changes in your branch, then submit these as a Pull Request (PR) 
on GitHub for review. Adding code reviewers to your PR is crucial for collaborative code quality assurance. 

First, go to this projects GitHub [page](https://github.com/maprihoda/data_analysis_demo/tree/main) and create a fork.


### Configure the remote repositories:

Navigate to the cloned project's root directory (see the README for how to clone this project):

    cd data_analysis_demo

Upstream will be this project's main repository. This is where you'll fetch the latest changes from.

    git remote add upstream git@github.com:maprihoda/data_analysis_demo.git

Origin will be your fork of the project. This is where you'll push your changes to.

    git remote remove origin
    git remote add origin git@github.com:<YOUR-GITHUB-USERNAME>/data_analysis_demo.git


Ensure your remotes are set up correctly:

    git remote -vv


### Developing in a local feature branch:

Start by ensuring your main branch is up-to-date:

    git checkout main
    git pull upstream main

Create a feature branch, naming it after your JIRA ticket:

    git checkout -b feature_branch

Add and commit your changes, including a meaningful message and the JIRA ticket identifier::

    git add -A

    git commit -m 'Commit message containing the JIRA ticket identifier. Bullet points should follow after an empty line'


Before creating a Pull Request, squash your commits to the feature branch into a single commit. This simplifies history 
and review. Use your IDE for an easier process.


### Create a Pull Request:

Push your feature branch to your fork:

    git push origin feature_branch

Then, follow the GitHub instructions to create a PR. Copy the provided link and open it in a browser.

Select colleagues as reviewers for your PR. Engage in the review process and address any comments.

After squashing, if you need to make further changes, ensure there's only one commit per PR:

    git push --force-with-lease origin feature_branch

This workflow ensures a clean, understandable history and facilitates a collaborative development process.
