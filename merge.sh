# Specify your master branch name that you want to merge to your branch
#
branchName=$1

# The commit message
commitMess=$2

# Save current working dir
git stash

# Get new code from master branch
git fetch origin $branchName:$branchName
git pull origin $branchName

# Merge and check if there is merge conflict
git merge --no-edit --no-ff $branchName
git stash apply

exitcode=$?


if [ $exitcode -eq 0 ]; then
   echo "Merge success"
#    git add .
#    git commit -am"$commitMess"
#    git push

else
   echo "Merge conflict, fix before push"
fi