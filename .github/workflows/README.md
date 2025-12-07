# ACTIONS

NOTE:

- The pipeline only build and tests. It does not deploy the code yet.  

## Devcontainer Builds

Pull images.

```sh
# checkout the auth status
gh auth status -t

# add scopes 
gh auth refresh -h github.com -s read:packages -s write:packages

# login into docker
echo $(gh auth token) | docker login ghcr.io -u $(gh api user -q .login) --password-stdin

# pull images
docker pull ghcr.io/chrisguest75/renovate_examples/devcontainer:136-merge-fbf1287
```

## List Github Container Images

```sh
export PAGER=
gh api "orgs/chrisguest75/renovate_examples?package_type=container" --jq '.[].name'

gh api "orgs/chrisguest75/packages/container/renovate_examples%2Fdevcontainer/versions" --paginate --jq '.[] | {id, name: .name, tags: .metadata.container.tags}'

gh api --method DELETE -H "Accept: application/vnd.github+json" "orgs/chrisguest75/packages/container/renovate_examples%2Fdevcontainer/versions"

```

## Resources

- https://github.com/actions/starter-workflows/tree/main
- https://github.com/marketplace/actions/setup-just
- https://github.com/google-github-actions
- https://github.com/google-github-actions/auth
