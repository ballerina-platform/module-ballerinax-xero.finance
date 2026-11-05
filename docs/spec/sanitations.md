_Author_:  @Dimuthu Madushan \
_Created_: 2026/09/30 \
_Updated_: 2026/10/05 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from Xero Finance. 
The OpenAPI specification is obtained from [Xero Finance API 19.0.0](https://github.com/wso2/api-specs/blob/main/openapi/xero/finance/19.0.0/openapi.yaml).
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

1. Replaced the generic `Success` description of every 200 response with a description of the returned report (for example "Balance sheet report") directly in the original `docs/spec/openapi.yaml`. All 8 operations are covered, so `aligned_ballerina_openapi.json` is reproduced from the original spec without further edits.

2. Set the operation IDs and schema names through the stable mappings in `ai-mappings.json`. All operation IDs and all 44 schema names are kept as the specification defines them.

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/aligned_ballerina_openapi.json --mode client --license docs/license.txt -o ballerina --client-methods remote
```

Note: The license year is hardcoded to 2024, change if necessary.
