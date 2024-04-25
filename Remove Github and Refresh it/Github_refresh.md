# how to delete all commit history in github? [duplicate]

1.Checkout/create orphan branch (this branch won't show in git branch command):

    git checkout --orphan latest_branch

2.Add all the files to the newly created branch:

     git add -A

3.Commit the changes:

    git commit -am "commit message"

4.Delete main (default) branch (this step is permanent):

    git branch -D main

6.Finally, all changes are completed on your local repository, and force update your remote repository:

    git push -f origin main

PS: This will not keep your old commit history around. Now you should only see your new commit in the history of your git repository.
[link](https://stackoverflow.com/questions/13716658/how-to-delete-all-commit-history-in-github)