
## Set up for collaboration:

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

To keep your feature branch up-to-date with the latest changes in the main branch and to minimize 
the possibility of merge conflicts when merging your PR, regularly rebase your feature branch 
on top of the updated main branch:

    git checkout main
    git pull upstream main
    git checkout feature_branch
    git rebase main


### Create a Pull Request:

Push your feature branch to your fork:

    git push origin feature_branch

Then, follow the GitHub instructions to create a PR. Copy the provided link and open it in a browser.

Select colleagues as reviewers for your PR. Engage in the review process and address any comments.

After squashing, if you need to make further changes, ensure there's only one commit per PR:

    git push --force-with-lease origin feature_branch

This workflow ensures a clean, understandable history and facilitates a collaborative development process.


### Merge your Pull Request:

When your pull request (PR) is ready and has been approved by your colleagues, you can proceed to merge it 
into the main branch. Here's how to do it:

1. Go to GitHub and navigate to your repository where the PR is located.
2. Find your PR in the "Pull Requests" section and click on it to open the PR details.
3. Before merging, ensure all checks (like continuous integration tests) have passed 
and that there are no conflicts with the base branch.
4. Click on the "Merge pull request" button. Select the "Rebase and merge" option. 
This option will reapply your commit on top of the base branch without creating a merge commit, 
keeping the project history linear and clean.
5. Confirm the merge by clicking on the "Confirm rebase and merge" button.

After merging, it's a good practice to delete the feature branch to keep the repository tidy. You can do this 
by clicking the "Delete branch" button that appears after the merge is complete.
