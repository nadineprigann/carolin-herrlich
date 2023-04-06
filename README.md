# README

The _pw-nuxt-kickstart_ repository serves as a starting point for websites built on top of a [ProcessWire](https://processwire.com/) backend and a [Nuxt](https://nuxt.com/) frontend. They reside in their separate directories inside `/backend/` and `/frontend/` respectively.

## Preparation

1. Initialize a (private) repository on GitHub.

2. Run the following commands to duplicate the _pw-nuxt-kickstart_ repository:

```console
git clone --bare git@github.com:sprsprspr/pw-nuxt-kickstart.git
cd pw-nuxt-kickstart.git
git push --mirror git@github.com:sprsprspr/PROJECT.git
cd ..
rm -rf pw-nuxt-kickstart.git
```

3. Clone the new repository and add _pw-nuxt-kickstart_ as a remote:

```console
git remote add default git@github.com:sprsprspr/pw-nuxt-kickstart.git
```

4. Create a _dev_ branch (if not already existing) and publish it to the remote repository.

5. Protect the main branch (see GitHub repository settings).

## Update repository

Whenever there are new commits made to the _pw-nuxt-kickstart_ that should be applied to one of its instances, simply [fetch](https://git-scm.com/docs/git-fetch) them:

```console
git fetch default dev
```

List the new commits:

```console
git log --oneline dev..default/dev
```

Pick commits with [git-cherry-pick](https://git-scm.com/docs/git-cherry-pick):

```console
git cherry-pick -x <commit>`
```

## Backend

All paths in this chapter are relative to the `/backend/` folder.

### Installation

Note: In case ProcessWire has already been installed, then directly go to _Setup_.

1. [Download](https://processwire.com/download/core/) the latest ProcessWire archive and extract its content to the `dist/` folder.
2. Create a MySQL database with a _utfmb4_unicode_ci_ collation.
3. Initiate the ProcessWire installer in the browser.
4. Select the _Headless_ site profile in the first step.
5. In the next step, select `utf8mb4` as DB charset and `InnoDB` as DB engine.
6. After installation, duplicate `config.php`, rename it to `config-default.php` and clear out all sensitive data. Also duplicate `.htaccess` and rename it to `htaccess.txt`.

### Setup

In case ProcessWire is already installed in the `dist/` directory, then simply grab the latest database dump under `dist/site/assets/backups/database/` and import it to a local database with the collation `utf8mb4_unicode_ci`. Afterwards **duplicate** `config-default.php`, rename the copy to `config.php` and enter all necessary credentials. Also **duplicate** `htaccess.txt` and rename the copy to `.htaccess`. When setting up a local webserver, the document root has to point to the `dist/` directory.

Make sure to update the existing API key in the _AppApi_ module settings.

In order to allow the frontend to access the backend API, set `$config->_frontendUrl` in `config.php` to the appropriate value. Leaving this value empty will result in CORS errors when trying to access the API.

On a live server, make sure to [optimize the handling of 404s](https://processwire.com/blog/posts/optimizing-404s-in-processwire/) and only allow HTTPS connections (inside `.htaccess` file or via web hosting).

### Directory structure

There is currently only a `dist/` directory that initially holds the _Headless_ site profile. After installing ProcessWire, it contains all files that are meant to be deployed to the webserver on a separate subdomain (e.g. backend.mydomain.com).

Within `dist/site/templates/api/` resides the API. It is by default reachable via `/api/` in the browser.

### Deployment

The backend deployment is handled by [GitHub actions](https://help.github.com/en/actions). The corresponding workflow can be found under `/.github/workflows/backend.yml`. Make sure to set the environment variables accordingly and to create a [GitHub secret](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets) called `BACKEND_PASSWORD` that holds the FTP password (no special characters allowed!).

After the first deployment, make sure to add `.htaccess` and `config.php` on the web server (see _Setup_).

## Frontend

The Frontend has been initiated with [Nuxi](https://nuxt.com/docs/getting-started/installation#new-project).

All paths in this chapter are relative to the `/frontend/` folder.

### Installation

Within the `/frontend/` folder run the following command:

```console
pnpm install
```

To start developing, run...

```console
pnpm dev
```

### Setup

**Duplicate** `.env.example`, rename the copy to `.env` and adjust its values according to the local/deployment environment.

### Deployment

The frontend build and deployment is handled by [GitHub actions](https://help.github.com/en/actions). The corresponding workflow can be found under `/.github/workflows/frontend.yml`. Make sure to set the environment variables in `.env.production` accordingly and to create a [GitHub secret](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets) called `FRONTEND_PASSWORD` that holds the FTP password (no special characters allowed!).

If the build target is a static website (`pnpm generate`), make sure to install and configure Github Repository Dispatch module in the backend. This will trigger a re-deployment once a page has been updated.

## Alternative deployment via SSH

For both the frontend and the backend the GitHub workflow files also offer a deployment via SSH. For it to work, you need to create an SSH key in the following format:

```console
ssh-keygen -m PEM -t rsa -b 4096
```

or

```console
ssh-keygen -m PEM -t ed25519
```

Then, copy the public key to the webserver:

```console
ssh-copy-id -i /path/to/key -p PORT user@host
```

Lastly, copy the private key to the clipboard...

```console
pbcopy < /path/to/key
```

...and paste it as a GitHub secret called `SERVER_SSH_KEY`.
