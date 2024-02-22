# Lint Branch Name

A simple example of a `pre-push` git hook that checks if the branch name is valid based on a regex.

By default, the regex is `^ABC\-[0-9]+\-([a-z0-9\-]+)$`, which means:

- The branch name must start with `ABC-`
- Followed by a number
- Followed by a `-`
- Followed by a kebab-case string

It checks only new branches, not existing ones.

## Usage

```shell
# Install dependencies
npm install

# Create an invalid branch
git checkout -b invalid-branch

# Push the invalid branch
git push origin invalid-branch

# The hook should prevent the push, and display an error message:
```
