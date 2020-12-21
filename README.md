# AWS Lambda Go Monorepo Template

Having setup such an environment for [Credit Companion](https://github.com/tjmgregory/credit-companion), I felt others may benefit from such a setup.

This template enables you to write [AWS Lambda functions](https://github.com/tjmgregory/credit-companion) in [Go](https://golang.org/) which can share packages without the need to host each package in its own seperate repository.

This model is appropriate for users happy to trade-off package versioning for the gain of tighter development cycles. Other pros/cons of Monorepos can be found [here](https://medium.com/better-programming/the-pros-and-cons-monorepos-explained-f86c998392e1).

### How to use

Functions that you would like to be deployed should be written as individual Go packages unders `functions/`.

Code that you wish to share between functions should be written as Go packages under `packages/`.

## Tools involved

### [AWS Lambda](http://aws.amazon.com/)

Where we shall deploy the serverless functions that are declared in `functions/`.

### [Go](https://golang.org)

A friendlier C with much of the power.

### [Serverless](https://www.serverless.com/)

Deployment tool which streamlines deploying a function to AWS. Configurable with `serverless.yml`.

### [Github Actions](https://github.com/features/actions)

CI steps included on each push to ensure tests are always passing. Configurable with `.github/workflows/go.yml`

### [Node](https://nodejs.org/en/) & [Yarn](https://yarnpkg.com/)

To use Serverless and for easier deployment scripting.

`go.mod` files do not support string building, thus linking local modules at build time is not possible from a root directory. To circument this, as can be seen in `build.sh`, we must change directory into each funciton/package in turn.

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
