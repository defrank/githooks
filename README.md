# githooks
Git hook scripts.  The initial problem I tried to resolve was managing submodules in a project.
Having to remember to constantly run `git submodule update` when pulling or checking out a branch.
I decided to solve this issue with another submodule.  The idea is to symlink them to your project's hooks.

I will strive to make the default githooks always be acceptable for any project, such as syncing submodules.
I will try to devise a system for githook add-ons if they begin to stray from this.

## Install
NOTE: The install script currently only symlinks all hooks, but will eventually add an option for selective
symlink; however, seeing as the only two hooks are closely related and offer only the feature to manage
submodules, this is not a priority.

1. Add as a dependency to your project.  I like to put submodules that do not have to be in a particular
location under `$GIT_PROJECT_ROOT/modules/`.

        cd $GIT_PROJECT_ROOT
        git submodule add https://github.com/defrank/githooks.git ./modules/githooks
1. Run install script.  Will ask which project to setup along all of the parent directories from githooks.

        ./modules/githooks/install.sh
        
1. Now try git-pull and git-checkout and see your submodules auto-update :smile:.
If you feel satisfied, git-add the changes and commit them!

## Guidelines
### Issues
* [Construct issue as user story](https://www.zenhub.com/blog/best-practices-for-github-issues/):
    * "As a (user type), I want to (task) so that (goal)."
    <br/>"As a (customer), I want to (create an account) so that (I can make purchases)."
