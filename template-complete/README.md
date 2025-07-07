# template-complete

## Scenario Description

This scenario addresses a critical question: "Are we template-complete?"

Essentially, this asks, "Have all attestations defined in our flow template been submitted for a specific trail?" 

Answering this question ensures that the software asset has undergone all required checks and procedures before deployment, thereby maintaining compliance and quality standards throughout your SDLC.

## Solution Example

While Kosli does not have a cli command to check this directly, you can determine if a flow is template-complete by examining the `attestations_statuses` within the JSON output of the `kosli get trail` command.

- First, execute kosli get trail with the `-o json` flag to retrieve the trail's data in JSON format. 

```bash

kosli get trail <FLOW_NAME> <TRAIL_ID> -o json

```

For instance, to get the JSON output for a trail named dashboard-ci with the ID 1159a6f1193150681b8484545150334e89de6c1c, you'd run:

```bash


kosli get trail dashboard-ci 1159a6f1193150681b8484545150334e89de6c1c --output=json

```

Once you have the JSON output, parse it to inspect the attestations_statuses field. This field indicates whether each attestation defined in your flow's template has been submitted for that specific trail. By checking the statuses within this section, you can programmatically confirm if all required attestations are present, verifying that the flow is template-complete.