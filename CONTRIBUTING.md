# Contribution Guidelines

First and foremost, we’d like to express our gratitude to you for taking the time to contribute.
We welcome and appreciate any and all contributions via
[Pull Requests] along the [GitHub Flow].

1. [Open a GitHub issue](#open-a-github-issue)
2. [Fork the repository on GitHub](#fork-the-repository-on-github)
3. [Install the pre-commit hooks](#install-the-pre-commit-hooks)
4. [Update the documentation](#update-the-documentation)
5. [Update the code](#update-the-code)
6. [Create a pull request](#create-a-pull-request)
7. [Merge and release](#merge-and-release)

## Open a GitHub issue

For bug reports or requests, please submit your issue in the appropriate repository.

We advise that you open an issue and ask the
[CODEOWNERS] and community prior to starting a contribution.
This is your chance to ask questions and receive feedback before
writing (potentially wrong) code. We value the direct contact with our community
a lot, so don't hesitate to ask any questions.

## Fork the repository on GitHub

[Fork] the repository into your own GitHub account and [create a new branch] as
described in the [GitHub Flow].

## Install the pre-commit hooks

If the repository you're working on ships with a
[`.pre-commit-config.yaml`][pre-commit-file],
make sure the necessary hooks have been installed before you begin working
(e.g. a `pre-commit install`).

## Update the documentation

We encourage you to update the documentation before writing any code (please see
[Readme Driven Development]. This ensures the
documentation stays up to date and allows you to think through the problem fully before you begin implementing any
changes.

## Update the code

At this point, make your code changes and constantly test again your new test case to make sure that everything working
properly. Do [commit] early and often and make useful commit messages.

If a backwards incompatible change cannot be avoided, please make sure to call that out when you submit a pull request,
explaining why the change is absolutely necessary.

## Create a pull request

[Create a pull request] with your changes.
Please make sure to include the following:

1. A description of the change, including a link to your GitHub issue.
1. Any notes on backwards incompatibility or downtime.

## Merge and release

The [CODEOWNERS] of the repository will review your code and provide feedback.
If everything looks good, they will merge the code and potentially release a new version while following the principles of [Semantic Versioning (SemVer)].

### Releases

Release Please will create and update a pull request, which updates the CHANGELOG and prepares for a release. A [CODEOWNERS] will merge this at their discretion to action a release.

<!-- References -->

[pull requests]: https://github.com/gaima8/terraform-github-repository/pulls
[pre-commit-file]: https://github.com/gaima8/terraform-github-repository/blob/main/.pre-commit-config.yaml
[github flow]: https://guides.github.com/introduction/flow/
[codeowners]: https://help.github.com/en/github/creating-cloning-and-archiving-repositories/about-code-owners
[fork]: https://help.github.com/en/github/getting-started-with-github/fork-a-repo
[create a new branch]: https://guides.github.com/introduction/flow/
[readme driven development]: https://tom.preston-werner.com/2010/08/23/readme-driven-development.html
[commit]: https://help.github.com/en/desktop/contributing-to-projects/committing-and-reviewing-changes-to-your-project
[create a pull request]: https://help.github.com/articles/creating-a-pull-request/
[semantic versioning (semver)]: https://semver.org/
