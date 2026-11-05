# Contact revenue and expense analysis

This example compares revenue and expense totals by contact and then checks the cash validation position of the organisation's bank accounts. Use it as the basis of a lending review.

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
  startDate = "2024-02-01"
  endDate = "2025-01-31"
  ```

## Run the example

```bash
bal run
```
