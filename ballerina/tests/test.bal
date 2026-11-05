// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations

import ballerina/os;
import ballerina/test;

final boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";
final string serviceUrl = isLiveServer ? "https://api.xero.com/finance.xro/1.0" : "http://localhost:9090";
final string token = isLiveServer ? os:getEnv("XERO_ACCESS_TOKEN") : "test_token";
final string tenantId = isLiveServer ? os:getEnv("XERO_TENANT_ID") : "test-tenant-id";
final string bankAccountId = isLiveServer ? os:getEnv("XERO_BANK_ACCOUNT_ID") : "4f0d7a3e-2c1b-4a8e-9d55-6b1e0c7a9f21";

final Client xeroClient = check new ({auth: {token}, httpVersion: isLiveServer ? "2.0" : "1.1"}, serviceUrl);

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetCashValidation() returns error? {
    CashValidationResponse[] response = check xeroClient->getCashValidation({xeroTenantId: tenantId});
    test:assertTrue(response.length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetBalanceSheet() returns error? {
    BalanceSheetResponse response = check xeroClient->getFinancialStatementBalanceSheet({xeroTenantId: tenantId});
    test:assertTrue(response?.balanceDate !is ());
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetCashflow() returns error? {
    CashflowResponse response = check xeroClient->getFinancialStatementCashflow({xeroTenantId: tenantId});
    test:assertTrue(response?.cashBalance !is ());
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetProfitAndLoss() returns error? {
    ProfitAndLossResponse response = check xeroClient->getFinancialStatementProfitAndLoss({xeroTenantId: tenantId});
    test:assertTrue(response?.netProfitLoss !is ());
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetTrialBalance() returns error? {
    TrialBalanceResponse response = check xeroClient->getFinancialStatementTrialBalance({xeroTenantId: tenantId});
    test:assertTrue(response?.accounts !is ());
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetContactsRevenue() returns error? {
    IncomeByContactResponse response = check xeroClient->getFinancialStatementContactsRevenue({xeroTenantId: tenantId});
    test:assertTrue(response?.contacts !is ());
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetContactsExpense() returns error? {
    IncomeByContactResponse response = check xeroClient->getFinancialStatementContactsExpense({xeroTenantId: tenantId});
    test:assertTrue(response?.contacts !is ());
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetBankStatementAccounting() returns error? {
    BankStatementAccountingResponse response = check xeroClient->getBankStatementAccounting(
        {xeroTenantId: tenantId}, bankAccountID = bankAccountId, fromDate = "2025-01-01", toDate = "2025-01-31");
    test:assertTrue(response?.statements !is ());
}
