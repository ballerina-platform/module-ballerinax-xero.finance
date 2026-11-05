# Running Tests

## Prerequisites

The tests run against a local mock server by default and need no credentials. To run them against the live Xero Finance API, set:

```bash
export IS_LIVE_SERVER=true
export XERO_ACCESS_TOKEN=<access token with the finance scopes>
export XERO_TENANT_ID=<tenant id>
export XERO_BANK_ACCOUNT_ID=<bank account id>
```

## Running the tests

```bash
bal test
```

Use `bal test --groups mock_tests` for the mock server only, or `--groups live_tests` for the live API.

## Test coverage

The suite has one test per operation, for all 8 operations: cash validation, the balance sheet, cash flow, profit and loss and trial balance reports, revenue and expense by contact, and bank statement accounting.
