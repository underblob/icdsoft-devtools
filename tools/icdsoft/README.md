# Development Tools

> Helper shell scripts to set up tooling for your local development computer.

⚠️ These tools are made for Mac OS to use with Terminal or equivalent.

## System Requirements

To see the required programs you need on your local computer for development:

```sh
./tools/icdsoft/system_requirements.sh
```

To install the required prgrams:

```sh
./tools/icdsoft/install.sh
```

> ⚠️ `direnv` requires additional configuration in the shell's runtime config. See [https://direnv.net/docs/hook.html](https://direnv.net/docs/hook.html)

## Sync to Remote

You can upload modified files to your remote web server via SSH key.

- Register SSH key with host: [SureSupport docs](https://tickets.suresupport.com/faq/category-314/en/ssh)
- Create `.envrc` file from `.envrc.sample` if one does not exist.
- Update the secrets in `.envrc` with correct values.

Sync once:

```sh
./tools/icdsoft/sync.sh
```

Sync every file change:

```sh
./tools/icdsoft/sync_watch.sh
```
