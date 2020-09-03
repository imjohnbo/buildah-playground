# Buildah Playground

![workflow badge](https://github.com/imjohnbo/buildah-playground/workflows/CI/badge.svg)

This example project shows how [Buildah](https://github.com/containers/buildah), [Dive](https://github.com/wagoodman/dive), and [Skopeo](https://github.com/containers/skopeo) can be used with GitHub Actions, GitHub Container Registry, and Azure Container Registry. 🚀

[`site`](site) is built, pushed to a "dev" registry, tested for optimization, then pushed to a "prod" registry.

## Setup

* Create an Azure Container Registry ([CLI docs](https://docs.microsoft.com/en-us/cli/azure/acr?view=azure-cli-latest#az-acr-create))
* Create a service principal that has push access to the registry ([docs](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-auth-service-principal#create-a-service-principal))
* Create a GitHub Personal Access Token (PAT) with [scopes necessary](https://docs.github.com/en/packages/getting-started-with-github-container-registry/migrating-to-github-container-registry-for-docker-images#authenticating-with-the-container-registry) to push an image to [GitHub Container Registry](https://docs.github.com/en/packages/getting-started-with-github-container-registry)

### Secrets

Required secrets:
* `CR_PAT` - PAT w/ proper scopes for GHCR
* `AZ_LOGIN` - Azure Service Principal ID
* `AZ_PASSWORD` - Azure Service Principal Password
* `AZ_REGISTRY` - Azure Container Registry name

## Usage

Upon `push` to [`site`](site) or manual trigger, [`ci.yml`](.github/workflows/ci.yml) kicks off, building a container image out of [`site`](site) using Buildah, tagging it with the Git `sha` and pushing it to GitHub Container Registry. We're using GHCR as our "dev" registry in this case. This image is private by default and will be available on your user or organization profile, eg. https://github.com/octocat?tab=packages. The workflow then pulls it down again to run optimization tests, and finally pushes it to Azure Container Registry, our "prod" registry.

## License

[MIT](LICENSE)

## Credits

Adapted from [`mkdev`](https://mkdev.me/)'s tutorial: https://www.youtube.com/watch?v=aViKsSEGwOc