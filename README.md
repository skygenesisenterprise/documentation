# Documentation

[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC_BY--SA_4.0-lightgrey.svg)](LICENSE)
[![Node.js 24](https://img.shields.io/badge/Node.js-24-339933?logo=nodedotjs&logoColor=white)](https://nodejs.org)
[![pnpm 10](https://img.shields.io/badge/pnpm-10-F69220?logo=pnpm&logoColor=white)](https://pnpm.io)
[![TypeScript](https://img.shields.io/badge/TypeScript-7.0-3178C6?logo=typescript&logoColor=white)](https://typescriptlang.org)
[![Next.js](https://img.shields.io/badge/Next.js-16-000000?logo=nextdotjs&logoColor=white)](https://nextjs.org)
[![Fumadocs](https://img.shields.io/badge/Fumadocs-16-0F172A?logo=readthedocs&logoColor=white)](https://fumadocs.dev)
[![PRs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](.github/CONTRIBUTING.md)
[![Discord](https://img.shields.io/badge/Discord-join-5865F2?logo=discord&logoColor=white)](https://discord.gg/GUkDugVh34)

> The authoritative guide to understanding, deploying, integrating and operating Notploy.

**Sky Genesis Enterprise Documentation** is the documentation site for [Notploy](https://notploy.com), the open-source, self-hostable platform for deploying and operating applications, databases and Docker Compose stacks on servers you own. It covers the product model, guided installation, applications and deployment, infrastructure, administration, security, migration and the full CLI, API and template references.

The site is built with Next.js, Fumadocs and MDX, and is published at [docs.skygenesisenterprise.com](https://docs.skygenesisenterprise.com). Every page is also available as plain text through `llms.txt` and `llms-full.txt` for editors, search tools and AI assistants.

**Perfect for:** platform and DevOps teams, self-hosting enthusiasts, agencies running client infrastructure, contributors, and anyone who needs a precise, versioned reference for Notploy.

## Contents

- [Documentation](#documentation)
  - [Contents](#contents)
  - [Why this documentation matters](#why-this-documentation-matters)
  - [What you can find](#what-you-can-find)
    - [Discover](#discover)
    - [Deploy \& operate](#deploy--operate)
    - [Integrate](#integrate)
    - [Templates](#templates)
  - [Quick start](#quick-start)
    - [Prerequisites](#prerequisites)
    - [Run locally](#run-locally)
    - [Environment variables](#environment-variables)
    - [Production build](#production-build)
    - [Static export](#static-export)
  - [How the documentation is built](#how-the-documentation-is-built)
    - [Stack](#stack)
    - [Repository layout](#repository-layout)
    - [Content sections](#content-sections)
    - [Generated references](#generated-references)
    - [Built-in documentation features](#built-in-documentation-features)
  - [Development](#development)
    - [Commands](#commands)
    - [Writing content](#writing-content)
    - [API and CLI references](#api-and-cli-references)
    - [Redirects and legacy URLs](#redirects-and-legacy-urls)
  - [FAQ](#faq)
    - [Is the documentation open source?](#is-the-documentation-open-source)
    - [Do I need Notploy installed to use it?](#do-i-need-notploy-installed-to-use-it)
    - [Where is the API reference?](#where-is-the-api-reference)
    - [Can I feed the docs to an LLM or a search tool?](#can-i-feed-the-docs-to-an-llm-or-a-search-tool)
    - [How do I report an error or a missing page?](#how-do-i-report-an-error-or-a-missing-page)
  - [Related resources](#related-resources)
    - [Official](#official)
    - [Community](#community)
    - [Commercial](#commercial)
  - [Contributing](#contributing)
  - [Security](#security)
  - [License](#license)
  - [Note](#note)

## Why this documentation matters

🎯 **One authoritative source** — Product model, installation, operations, security and the generated CLI and API references live in the same versioned repository as the code they describe.

🚀 **A guided path from zero to deployed** — Start with the concepts, follow the get-started flow to a first deployment, then reach for the reference pages when you need exact flags, endpoints or configuration keys.

📦 **Generated where it must be exact** — The API reference is generated from the OpenAPI specification and the CLI reference from the command registry, so the docs follow the product instead of drifting from it.

🔒 **Openly licensed and auditable** — The documentation is CC BY-SA 4.0, written in MDX, and every change is reviewable in a pull request.

🧩 **Works for humans and machines** — Every page is available as rendered HTML, Markdown-shaped source, `llms.txt`, `llms-full.txt`, and a sitemap, making the content easy to search, index and reuse.

🤝 **Community maintained** — Contributions are welcome, from typo fixes to new guides, as long as they follow the contribution guide and code of conduct.

## What you can find

### Discover

- Understand what Notploy is, how it is architected, and the core concepts used throughout the documentation.
- Compare Notploy with other platforms and learn how it fits into an existing ecosystem.
- Read the glossary, feature matrix, FAQ, philosophy and compatibility notes.

### Deploy & operate

- Follow prerequisites, installation, first login, first deployment, domain and TLS setup, verification, upgrades and backups.
- Configure applications, databases, Docker Compose projects, builds, volumes, environment variables and watch paths.
- Operate servers, clusters, Traefik, DNS, certificates, registries, storage, monitoring, notifications and backups.
- Apply production hardening, troubleshoot gateway errors, and migrate an existing Dokploy installation.

### Integrate

- Use the full [CLI reference](/docs/cli) for every command and flag the `notploy` binary exposes.
- Use the [API reference](/docs/api) and the OpenAPI specification for programmatic access.
- Learn about the SDK, MCP server, VS Code extension, GitHub Actions and AI integrations.

### Templates

- Browse blueprints, template configuration, the templates gallery and framework examples ready to deploy.

## Quick start

### Prerequisites

- **Node.js 24.4 or later in the 24.x line** (see `.nvmrc`)
- **pnpm 10.22 or later**
- No database, API key or running Notploy instance is required to browse or build the documentation.

### Run locally

Install dependencies from the repository root and start the development server:

```bash
git clone https://github.com/skygenesisenterprise/documentation.git
cd documentation
pnpm install --frozen-lockfile
pnpm dev
```

Open [http://localhost:3000](http://localhost:3000). The landing route redirects to the Core section at `/docs/core`.

### Environment variables

The site runs without configuration. To customise metadata, canonical links or first-party analytics, copy the example file and edit it:

```bash
cp .env.example .env.local
```

| Variable | Purpose |
| --- | --- |
| `NEXT_PUBLIC_APP_URL` | Base URL used for metadata and canonical links. Defaults to `https://docs.skygenesisenterprise.com`. |
| `NEXT_PUBLIC_NOTPLOY_TRAFFIC_ENDPOINT` | Notploy Traffic Manager endpoint. Instrumentation is disabled when unset. |
| `NEXT_PUBLIC_NOTPLOY_TRAFFIC_KEY` | Notploy Traffic Manager property key. Instrumentation is disabled when unset. |

Never commit `.env.local` or any real key. The Traffic Manager instrumentation renders nothing unless both traffic variables are present.

### Production build

The default build emits a traced Next.js standalone server:

```bash
pnpm install --frozen-lockfile
pnpm build
pnpm start
```

The server listens on port 3000 by default. Set `PORT` and `HOSTNAME` to override the bind address in a container or reverse-proxy deployment.

### Static export

For hosting on a static file server or a CDN, build the export instead of the standalone server:

```bash
NEXT_OUTPUT=export pnpm build
pnpm build:static-redirects
```

The generated site is written to `out/`. `pnpm build:static-redirects` materialises the legacy URL redirects as small HTML stubs, because `next.config.mjs` cannot emit `redirects()` under `output: "export"`. Set `NEXT_BASE_PATH` to serve the export from a subpath.

## How the documentation is built

The repository is a single Next.js application. Content is written in MDX under `content/docs` and loaded through Fumadocs; the application layer adds search, social cards, SEO routes and machine-readable exports.

### Stack

| Layer | Technology | Role |
| --- | --- | --- |
| Framework | Next.js 16 (App Router) | Routing, server rendering, standalone and static output |
| Runtime | React 19 | UI rendering |
| Content | Fumadocs MDX 14 + Fumadocs Core 16 | MDX collections, navigation, search and page rendering |
| API reference | Fumadocs OpenAPI 10 | Generates reference pages from `public/openapi.json` |
| UI | Fumadocs UI 16, Tailwind CSS 4, Radix UI | Layout, theming and components |
| Syntax highlighting | Shiki 3 | Code blocks in every page |
| Language | TypeScript 7 (strict) | Application and tooling code |

### Repository layout

```text
documentation/
├── app/                      # Next.js App Router
│   ├── docs/                 # Docs layout and catch-all page
│   ├── api/search/           # Search endpoint
│   ├── og/docs/              # Dynamic Open Graph images
│   ├── llms.txt/             # Machine-readable index of pages
│   ├── llms-full.txt/        # All pages as plain text
│   ├── robots.ts             # robots.txt route
│   └── sitemap.ts            # sitemap.xml route
├── components/               # Search, navigation, logo and traffic components
├── content/docs/             # MDX documentation
│   ├── core/                 # Product, deployment and operations
│   ├── cli/                  # CLI reference
│   ├── api/                  # API guides and generated reference
│   └── templates/            # Blueprints and framework examples
├── lib/                      # Fumadocs source loader and shared layout
├── public/                   # Logos, images and openapi.json
├── scripts/                  # Redirects, CLI generation and static redirects
├── generate-docs.mjs         # OpenAPI → MDX generator
├── source.config.ts          # Fumadocs collection schemas
├── next.config.mjs           # Standalone/export modes, base path and redirects
├── mdx-components.tsx        # MDX component mapping
├── Dockerfile                # Container build for the docs server
├── docker-compose.yml        # Website + docs stack
└── Makefile                  # Developer shortcuts around pnpm and Docker
```

### Content sections

| Section | Path | What it covers |
| --- | --- | --- |
| Core | `content/docs/core` | What Notploy is, architecture, getting started, applications, infrastructure, administration, security, migration and reference material |
| CLI | `content/docs/cli` | Every command group and flag exposed by the `notploy` binary, plus authentication and usage guides |
| API | `content/docs/api` | HTTP API guides, schemas, authentication and the generated endpoint reference |
| Templates | `content/docs/templates` | Blueprints, template configuration, gallery and framework examples |

The navigation order of each section is defined in its `meta.json`, and the overall section order is defined in `content/docs/meta.json`. Page counts shown on the documentation index are generated from the MDX tree, so they follow the actual content.

### Generated references

Two reference sections are derived from source artifacts and committed so that every change is visible in review:

- **API reference** — `generate-docs.mjs` reads `public/openapi.json` and writes the endpoint pages under `content/docs/api/reference`, plus their `meta.json`.
- **CLI reference** — `scripts/generate-cli-docs.mjs` reads the CLI command registry and writes the command pages under `content/docs/cli`.

Do not edit generated pages by hand. Change the source artifact, regenerate, and commit both the source and the generated output.

### Built-in documentation features

- **Search** — the Fumadocs search dialog backed by `app/api/search`.
- **LLM-friendly output** — `/llms.txt` lists every page with its description; `/llms-full.txt` returns the processed text of the whole documentation set.
- **Open Graph images** — dynamic per-page social cards under `/og/docs/...`.
- **SEO** — canonical metadata, `robots.txt`, `sitemap.xml` and redirects for legacy URLs.
- **Traffic Manager** — optional first-party analytics, disabled unless both traffic environment variables are set.
- **Static export support** — the same content can be shipped as a static site, including redirect stubs.

## Development

### Commands

Run every command from the repository root:

| Command | Purpose |
| --- | --- |
| `pnpm dev` | Start the development server on port 3000 |
| `pnpm build` | Build the site (standalone server by default) |
| `pnpm start` | Serve the production build |
| `pnpm types:check` | Regenerate Fumadocs collections and type-check the project |
| `pnpm generate:api` | Regenerate the API reference from `public/openapi.json` |
| `pnpm generate:api:check` | Fail if the committed API reference is stale |
| `pnpm generate:cli` | Regenerate the CLI reference from the command registry |
| `pnpm generate:cli:check` | Fail if the committed CLI reference is stale |
| `pnpm build:static-redirects` | Emit legacy redirect stubs after a static export |

`pnpm postinstall` runs `fumadocs-mdx` to prepare the content collections, so a fresh `pnpm install` is enough before the first `pnpm dev`.

### Writing content

1. Add or edit an `.mdx` file under the relevant `content/docs/<section>` directory.
2. Give each page a `title` and, ideally, a `description` in its frontmatter.
3. Update the section's `meta.json` if the page needs an explicit place in the navigation.
4. Put images in `public/assets` and reference them with root-relative paths.
5. Use the Fumadocs MDX components available through `mdx-components.tsx` for cards, callouts and richer layouts.

Keep headings descriptive, use sentence case for titles, and prefer tables for flags, endpoints and configuration keys. Run `pnpm types:check` and `pnpm build` before opening a pull request.

### API and CLI references

After the OpenAPI specification or the CLI command surface changes:

```bash
pnpm generate:api
pnpm generate:cli
pnpm types:check
pnpm build
```

CI-style verification of the committed output:

```bash
pnpm generate:api:check
pnpm generate:cli:check
```

### Redirects and legacy URLs

`next.config.mjs` redirects the root route to `/docs/core` and applies the legacy documentation redirects from `scripts/redirects.mjs`. Add new legacy mappings there rather than duplicating them in pages. For static hosting, run `pnpm build:static-redirects` after the export so those URLs keep working without a Node server.

## FAQ

### Is the documentation open source?

Yes. The documentation is licensed under [CC BY-SA 4.0](LICENSE), and contributions are welcome under the terms of the [Code of Conduct](CODE_OF_CONDUCT.md).

### Do I need Notploy installed to use it?

No. You can read the published site, run the site locally, or build a static export without a Notploy instance. A running Notploy server is only needed when you want to follow the deployment guides or configure Traffic Manager instrumentation.

### Where is the API reference?

The human-readable reference lives at `/docs/api`, and the underlying specification is [`public/openapi.json`](public/openapi.json). The endpoint pages are generated from that file.

### Can I feed the docs to an LLM or a search tool?

Yes. Use [`/llms.txt`](https://docs.skygenesisenterprise.com/llms.txt) for a compact page index and [`/llms-full.txt`](https://docs.skygenesisenterprise.com/llms-full.txt) for the full text. The MDX sources under `content/docs` are also plain text in the repository.

### How do I report an error or a missing page?

Open an issue with the [documentation template](.github/ISSUE_TEMPLATE/documentation.yml), or send a pull request using the [documentation pull request template](.github/PULL_REQUEST_TEMPLATE/documentation.md). Include the page URL and what is wrong or missing.

## Related resources

### Official

- Documentation: [docs.skygenesisenterprise.com](https://docs.skygenesisenterprise.com)
- Website: [notploy.com](https://notploy.com)
- Source code: [github.com/skygenesisenterprise/notploy](https://github.com/skygenesisenterprise/notploy)
- Templates: [templates.notploy.com](https://templates.notploy.com)
- Hosted platform: [app.notploy.com](https://app.notploy.com)
- Sky Genesis Enterprise: [skygenesisenterprise.com](https://skygenesisenterprise.com)

### Community

- Questions and discussions: [Notploy Discord](https://discord.gg/GUkDugVh34)
- Bugs and feature requests: [GitHub Issues](https://github.com/skygenesisenterprise/documentation/issues)
- Contribution guide: [`.github/CONTRIBUTING.md`](.github/CONTRIBUTING.md)
- Support: [support.skygenesisenterprise.com](https://support.skygenesisenterprise.com)

### Commercial

- Commercial edition, premium support and services: [Sky Genesis Enterprise](https://skygenesisenterprise.com)

## Contributing

Contributions and suggestions are welcome. Please read the [Code of Conduct](CODE_OF_CONDUCT.md) before participating, then follow the [contribution guide](.github/CONTRIBUTING.md) for setup and review expectations.

- Pick the right [pull request template](.github/PULL_REQUEST_TEMPLATE) for your change.
- Keep PR titles in [Conventional Commits](https://www.conventionalcommits.org) format (`fix: …`, `feat: …`, `docs: …`).
- Use the matching [issue template](.github/ISSUE_TEMPLATE) for bugs, features, improvements and documentation problems.
- Run `pnpm types:check` and `pnpm build` before opening a pull request.
- If you change generated content, run the matching `generate:*` command and commit the result.

## Security

Do not report security vulnerabilities in public issues. Follow the private reporting instructions in [SECURITY.md](SECURITY.md), and never paste secrets, tokens or credentials into an issue or pull request.

## License

The project is licensed under the [Creative Commons Attribution-ShareAlike 4.0 International License](LICENSE).

## Note

Sky Genesis Enterprise Documentation is an open-source project maintained by [Sky Genesis Enterprise](https://skygenesisenterprise.com). Links to external services are provided for convenience and do not imply endorsement. Check each service's own terms before relying on it in production.
