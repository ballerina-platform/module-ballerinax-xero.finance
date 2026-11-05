# Examples

The `ballerinax/xero.finance` connector provides practical examples illustrating usage in various scenarios.

1. [Period-end financial review](./period_end_financial_review/period_end_financial_review.md) - Summarise the balance sheet, profit and loss and trial balance for a reporting period.
2. [Contact revenue and expense analysis](./contact_revenue_expense_analysis/contact_revenue_expense_analysis.md) - Compare revenue and expense by contact and check the cash validation position.

## Prerequisites

1. Build and push the connector to your local Ballerina repository:

   ```bash
   cd ballerina
   bal pack && bal push --repository=local
   ```

2. For each example, create a `Config.toml` in the example directory with the OAuth 2.0 credentials (`clientId`, `clientSecret`, `refreshToken`, `refreshUrl`) and the `tenantId` of your Xero organisation.

## Running an example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the examples with the local module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
