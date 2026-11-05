# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `getFinancialStatementContactsRevenue` and `getFinancialStatementContactsExpense` operations, returning `IncomeByContactResponse`.
- `getBankStatementAccounting` operation, returning `BankStatementAccountingResponse`.
- Per-operation header and query records (for example `GetCashValidationHeaders` and `GetCashValidationQueries`).
- New response types for contact and bank statement data, including `ContactResponse`, `InvoiceResponse`, `CreditNoteResponse`, `PaymentResponse`, `BankTransactionResponse` and `StatementLineResponse`.
- `ConnectionConfig` fields `cookieConfig`, `followRedirects`, `socketConfig` and `laxDataBinding`; `cache`, `http1Settings`, `http2Settings` and `responseLimits` now have defaults and are passed to the HTTP client.

### Changed

- Regenerated the connector from the Xero Finance API 19.0.0 specification.
- Every operation now takes a headers record and included query parameters instead of positional arguments: `getCashValidation(xeroTenantId, balanceDate)` becomes `getCashValidation({xeroTenantId}, balanceDate = ...)`.
- Most records are now closed (`record {| ... |}`); code that sets fields outside the specification on them no longer compiles.
- Optional fields are no longer nilable (for example `BalanceSheetAccountType[]? accountTypes?` becomes `BalanceSheetAccountType[] accountTypes?`).
- `ConnectionConfig.proxy` and `ConnectionConfig.http1Settings` now use `http:ProxyConfig` and `http:ClientHttp1Settings`.

### Removed

- `getAccountUsage`, `getLockHistory`, `getReportHistory` and `getUserActivities` operations, which are not in the 19.0.0 specification.
- Types used only by those operations: `AccountUsage`, `AccountUsageResponse`, `LockHistoryModel`, `LockHistoryResponse`, `ReportHistoryModel`, `ReportHistoryResponse`, `HistoryRecordResponse`, `UserActivitiesResponse`, `UserResponse` and `PracticeResponse`.
- `Problem`, `ProblemType` and `CashValidationResponseArr` types.
- Connector-local `ProxyConfig` and `ClientHttp1Settings` types, replaced by their `http` module equivalents.
