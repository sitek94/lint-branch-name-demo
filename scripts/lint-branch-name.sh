#!/bin/bash

# ZERO_SHA is used to identify new branches (no corresponding remote branch exists yet).
ZERO_SHA="0000000000000000000000000000000000000000"
BRANCH_NAME_PATTERN="^ABC\-[0-9]+\-([a-z0-9\-]+)$"

while read local_ref local_sha remote_ref remote_sha; do
  if [ "$remote_sha" = "$ZERO_SHA" ]; then
    branch_name=$(basename $local_ref)
    
    if ! [[ "$branch_name" =~ $BRANCH_NAME_PATTERN ]]; then

      # Note: ">&2" is used to ensure error message visibility in command line interfaces and VS Code.
      # It redirects error message to standard error (stderr) 
      echo -e "\n\n🚫 Error: Branch name \"$branch_name\" does not match the required pattern 'ABC-N-brief-description-lower-kebab-case', where N is at least one number.\n\nPlease use the format 'ABC-1-your-description-here' for branch names.\n\n" >&2

      exit 1
    fi
  fi
done

exit 0
