# Period-end financial review

This example retrieves the balance sheet, the profit and loss report and the trial balance for a reporting period and prints a short summary. Use it to prepare a period-end review of an organisation in Xero.

## Prerequisites

- Ballerina Swan Lake 2201.12.0 or later
- Push the connector to the local repository:
  ```bash
  cd ballerina
  bal pack && bal push --repository=local
  ```
- Create a `Config.toml` in this directory:
  ```toml
  clientId = "<CLIENTID>"
  clientSecret = "<CLIENTSECRET>"
  refreshToken = "<REFRESHTOKEN>"
  refreshUrl = "https://identity.xero.com/connect/token"
  tenantId = "<TENANTID>"
  balanceDate = "2025-01-31"
  startDate = "2024-02-01"
  endDate = "2025-01-31"
  ```

## Run the example

```bash
bal run
```
