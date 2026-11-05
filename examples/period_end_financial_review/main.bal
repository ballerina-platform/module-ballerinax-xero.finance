// Pulls the balance sheet, profit and loss report and trial balance for a reporting period
// and prints a short period-end summary for a Xero organisation.

import ballerina/io;
import ballerinax/xero.finance;

configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;
configurable string refreshUrl = ?;
configurable string tenantId = ?;
configurable string balanceDate = ?;
configurable string startDate = ?;
configurable string endDate = ?;

public function main() returns error? {
    finance:Client xero = check new ({
        auth: {clientId, clientSecret, refreshToken, refreshUrl}
    });

    // Step 1: Balance sheet as at the period end
    finance:BalanceSheetResponse balanceSheet = check xero->getFinancialStatementBalanceSheet(
        {xeroTenantId: tenantId}, balanceDate = balanceDate);
    decimal assets = balanceSheet?.asset?.total ?: 0d;
    decimal liabilities = balanceSheet?.liability?.total ?: 0d;
    decimal equity = balanceSheet?.equity?.total ?: 0d;
    io:println(string `Balance sheet at ${balanceDate}: assets ${assets}, liabilities ${liabilities}, equity ${equity}`);

    // Step 2: Profit and loss for the period
    finance:ProfitAndLossResponse pnl = check xero->getFinancialStatementProfitAndLoss(
        {xeroTenantId: tenantId}, startDate = startDate, endDate = endDate);
    decimal netProfit = pnl?.netProfitLoss ?: 0d;
    io:println(string `Net profit or loss from ${startDate} to ${endDate}: ${netProfit}`);

    // Step 3: Trial balance for the period end
    finance:TrialBalanceResponse trialBalance = check xero->getFinancialStatementTrialBalance(
        {xeroTenantId: tenantId}, endDate = endDate);
    finance:TrialBalanceAccount[] accounts = trialBalance?.accounts ?: [];
    io:println(string `Trial balance lists ${accounts.length()} accounts`);
}
