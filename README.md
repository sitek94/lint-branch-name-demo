# Lint Branch Name

A simple example of a `pre-push` git hook that checks if the branch name is valid based on a regex.

By default, the regex is `^ABC\-[0-9]+\-([a-z0-9\-]+)$`, which means:

- The branch name must start with `ABC-`
- Followed by a number
- Followed by a `-`
- Followed by a kebab-case string

It checks only new branches, not existing ones.

## Usage

Install dependencies:
```shell
# Install dependencies
npm install
```

Create an invalid branch:
```shell
git checkout -b invalid-branch
```

Push the invalid branch:
```shell
git push origin invalid-branch
```

The hook should prevent the push, and display an error message:

![CleanShot 2024-02-22 at 20 27 45@2x](https://github.com/sitek94/lint-branch-name-demo/assets/58401630/c4b57e8e-e3d5-4f4a-a882-63d02e284f81)

