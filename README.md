# Ballerina Xero Finance connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-xero.finance/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-xero.finance/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-xero.finance.svg)](https://github.com/ballerina-platform/module-ballerinax-xero.finance/commits/main)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/xero.finance.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Fxero.finance)

## Overview

[Xero](https://www.xero.com/) is a cloud-based accounting platform for small and medium-sized businesses. The Xero Finance API gives lenders and financial partners read access to an organisation's financial statements, bank statement data and cash validation summaries so that they can assess a loan application with confidence.

The Xero Finance connector lets Ballerina applications call the Xero Finance API, version 19.0.0. It provides methods for financial statement reports, revenue and expense by contact reports, cash validation and bank statement accounting data.

## Setup guide

To use the Xero Finance connector you need a Xero account, a registered app and an access token that grants the finance scopes.

1. Sign in to the [Xero developer portal](https://developer.xero.com/app/manage) and select **New app**.

2. Enter an app name and company URL, choose **Web app**, and add a redirect URI that your application controls.

3. Open the **Configuration** page of the app and copy the **Client id**. Generate a **Client secret** and copy it.

4. Request the scopes your use case needs when you authorise the app: `offline_access`, `finance.statements.read`, `finance.cashvalidation.read` and `finance.bankstatementsplus.read`.

5. Complete the authorisation code flow to obtain a refresh token. The token endpoint is `https://identity.xero.com/connect/token`.

6. Call the `GET https://api.xero.com/connections` endpoint with the access token and copy the `tenantId` of the organisation you want to query.

> **Note:** The Finance API is available to Xero partners with the required finance scopes enabled for the app.

## Quickstart

To use the `xero.finance` connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the module

```ballerina
import ballerinax/xero.finance;
```

### Step 2: Instantiate a new connector

Create a `Config.toml` file with your credentials:

```toml
clientId = "<CLIENT_ID>"
clientSecret = "<CLIENT_SECRET>"
refreshToken = "<REFRESH_TOKEN>"
tenantId = "<TENANT_ID>"
```

Then create a `finance:Client` using them:

```ballerina
configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;
configurable string tenantId = ?;

finance:Client xero = check new ({
    auth: {
        clientId,
        clientSecret,
        refreshToken,
        refreshUrl: "https://identity.xero.com/connect/token"
    }
});
```

### Step 3: Invoke the connector operation

Retrieve the balance sheet report:

```ballerina
public function main() returns error? {
    finance:BalanceSheetResponse _ = check xero->getFinancialStatementBalanceSheet({xeroTenantId: tenantId});
}
```

### Step 4: Run the Ballerina application

```bash
bal run
```

## Examples

The `Xero Finance` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](examples/), covering the following use cases:

1. [Period-end financial review](examples/period_end_financial_review/period_end_financial_review.md) - Summarise the balance sheet, profit and loss and trial balance for a reporting period.
2. [Contact revenue and expense analysis](examples/contact_revenue_expense_analysis/contact_revenue_expense_analysis.md) - Compare revenue and expense by contact and check the cash validation position.

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 21. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`xero.finance` package](https://central.ballerina.io/ballerinax/xero.finance/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
