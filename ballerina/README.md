## Overview

[Xero](https://www.xero.com/) is a cloud-based accounting platform for small and medium-sized businesses. The Xero Finance API gives lenders and financial partners read access to an organisation's financial statements, bank statement data and cash validation summaries so that they can assess a loan application with confidence.

The Xero Finance connector lets Ballerina applications call the Xero Finance API, version 19.0.0. It provides methods for financial statement reports, revenue and expense by contact reports, cash validation and bank statement accounting data.

### Key features

- Retrieve balance sheet, profit and loss, cash flow and trial balance reports
- Analyse revenue and expense totals by customer and supplier contact
- Validate cash positions across bank accounts and reconciled statement lines
- Access bank statement data together with the matching accounting transactions
- Authenticate with OAuth 2.0 using a refresh token or a bearer token

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

The `Xero Finance` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](../examples/), covering the following use cases:

1. [Period-end financial review](../examples/period_end_financial_review/period_end_financial_review.md) - Summarise the balance sheet, profit and loss and trial balance for a reporting period.
2. [Contact revenue and expense analysis](../examples/contact_revenue_expense_analysis/contact_revenue_expense_analysis.md) - Compare revenue and expense by contact and check the cash validation position.
