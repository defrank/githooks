#!/bin/sh

cd "$(dirname $0)"

githooks="$PWD"
# Ignore githook repository.
project="$(dirname "$githooks")"
found=false
while [ "$found" = false ] && [ "$project" != '/' ]; do
    # Can only connect to root of a git project.
    if stat "$project/.git" >/dev/null 2>&1; then
        echo "Link githooks to project '$(basename $project)'?"
        select ans in 'yes' 'no' 'cancel'; do
            case $ans in
                yes )
                    found=true
                    break;;
                no )
                    project="$(dirname "$project")"
                    break;;
                cancel )
                    echo 'Canceled!'
                    exit 1
                    break;;
                * )
                    echo 'Please select the number of your answer.'
                    echo
                    break;;
            esac
        done
    else
        project="$(dirname "$project")"
    fi
done

if [ "$project" = '/' ]; then
    echo 'No more projects to try!'
    exit 1
fi

cd "$project/.git/hooks"
for hook in $githooks/hooks/* ; do
    # Create relative symlinks.
    hook="${hook/$project/../..}"
    if [ -x "$hook" ]; then
        ln -s "$hook" "$(basename "$hook")" 
    fi
done
