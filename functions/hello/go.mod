module exampleproject/functions/hello

go 1.15

replace exampleproject/packages/logging => ../../packages/logging

require (
	exampleproject/packages/logging v0.0.0-00010101000000-000000000000
	github.com/aws/aws-lambda-go v1.6.0
)
