// Compares customer revenue and supplier expense by contact and checks the cash validation
// position of the organisation's bank accounts for a lending review.

import ballerina/io;
import ballerinax/xero.finance;

configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;
configurable string refreshUrl = ?;
configurable string tenantId = ?;
configurable string startDate = ?;
configurable string endDate = ?;

public function main() returns error? {
    finance:Client xero = check new ({
        auth: {clientId, clientSecret, refreshToken, refreshUrl}
    });

    // Step 1: Revenue by contact
    finance:IncomeByContactResponse revenue = check xero->getFinancialStatementContactsRevenue(
        {xeroTenantId: tenantId}, startDate = startDate, endDate = endDate);
    decimal totalRevenue = revenue?.total ?: 0d;
    io:println(string `Total revenue: ${totalRevenue}`);

    // Step 2: Expense by contact
    finance:IncomeByContactResponse expense = check xero->getFinancialStatementContactsExpense(
        {xeroTenantId: tenantId}, startDate = startDate, endDate = endDate);
    decimal totalExpense = expense?.total ?: 0d;
    io:println(string `Total expense: ${totalExpense}`);

    finance:ContactDetail[] customers = revenue?.contacts ?: [];
    foreach finance:ContactDetail customer in customers {
        string customerName = customer?.name ?: "unknown";
        decimal customerTotal = customer?.total ?: 0d;
        io:println(string `Customer ${customerName}: ${customerTotal}`);
    }

    // Step 3: Cash validation for the bank accounts
    finance:CashValidationResponse[] validations = check xero->getCashValidation(
        {xeroTenantId: tenantId}, balanceDate = endDate);
    foreach finance:CashValidationResponse validation in validations {
        string accountId = validation?.accountId ?: "unknown";
        decimal balance = validation?.cashAccount?.accountBalance ?: 0d;
        io:println(string `Account ${accountId}: ledger balance ${balance}`);
    }
}
