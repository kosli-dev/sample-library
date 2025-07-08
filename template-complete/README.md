# template-complete

## Scenario Description

This scenario addresses a critical question: "Are we template-complete?"

Essentially, this asks, "Have all attestations defined in our flow template been submitted for a specific trail?"

## Examples

We have 3 examples, two of which are interesting:

* **Compliant, and template complete:** This one is the normal desired state, so we will not dive into this
* **Inconclussive, because of missing attestations:** Our template complete will fail, as there are one or more attestations not made. **This is scenario 1**.
* **Non-compliant, and template complete:** In this scenario, all compliances are there, but just not compliant (disregarding the reason). **This is scenario 2**

### 2. Template Completeness Check (`check-template-complete.sh`)

The `check-template-complete.sh` script analyzes the JSON output of a given trail to determine template completeness:

* Parses the `attestations_statuses` and `artifact_statusses` field from the trail data
* Identifies attestations with specific statuses (e.g., "MISSING", "COMPLETE"). In our scenario, we care about the MISSING status
* **Intentionally exits with code 1** when missing attestations are found

## Flow Template Configuration

The example uses a flow template defined in `kosli-config/flow.yaml` that requires:

* An artifact named "app"
* Two attestations: "sbom" (generic type) and "unit-tests" (junit type)
