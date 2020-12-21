# AWS Lambda Go Monorepo Template 🚝

This template enables you to write [AWS Lambda Functions](https://github.com/tjmgregory/credit-companion) in [Go](https://golang.org/), while sharing packages between lambdas without hosting each package/lambda in its own seperate repository.

Containing multiple packages within a single repository is known as a **Monorepo**. This model is appropriate for users happy to trade-off package versioning for the gain of tighter development cycles. Other pros/cons of Monorepos can be found [here](https://medium.com/better-programming/the-pros-and-cons-monorepos-explained-f86c998392e1).

Having setup such an environment for [Credit Companion](https://github.com/tjmgregory/credit-companion), I thought others may benefit from it.

## What does each part of this template do?

### [AWS Lambda](http://aws.amazon.com/)

Where the serverless functions that are declared in `functions/` are deployed to.

### [Go](https://golang.org)

A friendlier C with much of the power for writing our functions.

### [Serverless](https://www.serverless.com/)

Deployment tool which, for us, streamlines deploying code as a Lambda in AWS. Configurable with `serverless.yml`.

### [Github Actions](https://github.com/features/actions)

CI steps triggered on each push to run all tests in the project. Configurable with `.github/workflows/go.yml`.

### [Node](https://nodejs.org/en/) & [Yarn](https://yarnpkg.com/)

To support Serverless and for easier scripting.

`go.mod` files do not support string building, thus linking local modules at build time is not possible from a root directory.

To circument this, as can be seen in `build.sh`, we must `cd` into each function/package and build in turn.

### `functions/`

Each package under this directory must contain a `main.go`, which acts as the entrypoint for that lambda. Any code that you wish to share between lambdas should be moved to `packages/`.

To add a local package to a function, see the `replace` line in `functions/hello/go.mod`.

### `packages/`

All shared code should be written here. Each package must contain its own `mod.go` to declare its namespace.

## Setup

### Requirements

- [NVM](https://github.com/nvm-sh/nvm)
- [An AWS account](http://aws.amazon.com/)
- [AWS CLI](http://aws.amazon.com/cli/) configured [with access to your AWS account](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
- [Go](https://golang.org/doc/install)

For first time setup, run the following within the project root:

```bash
nvm use
npm install -g yarn
yarn install
```

### Build and deployment

To build the binaries for each function under `functions/`, run the following from anywhere in the repo:

```bash
yarn build
```

To run all tests under `functions/` and `packages/`, run the following from anywhere in the repo:

```bash
yarn test
```

To deploy your built binaries to AWS, run the following:

```bash
yarn deploy
```


# Credits

The `hello` function is a modified version of the [Serverless Hello World example](https://www.serverless.com/framework/docs/providers/aws/examples/hello-world/go/).

`logger.go` is lifted from [Chip Keyes' excellent article](https://medium.com/@ckeyes88/go-modules-in-real-life-87a21fb4d8aa) on Medium. 
