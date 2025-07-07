# template-complete

## Scenario Description

This scenario addresses a critical question: "Are we template-complete?"

Essentially, this asks, "Have all attestations defined in our flow template been submitted for a specific trail?" 

Answering this question ensures that the software asset has undergone all required checks and procedures before deployment, thereby maintaining compliance and quality standards throughout your SDLC.

## Automated Solution

This example provides an automated workflow that demonstrates how to check template completeness programmatically. The workflow consists of two main components:

### 1. Trail Creation and Data Collection (`1.sh`)

The `1.sh` script performs the following Kosli operations:

- Creates a new Kosli trail for the current Git commit
- Attests an artifact to the trail (creating an incomplete trail for demonstration)
- Retrieves the trail data in JSON format and saves it to `data.json`

### 2. Template Completeness Check (`check-template-complete.sh`)

The `check-template-complete.sh` script analyzes the JSON output to determine template completeness:

- Parses the `attestations_statuses` field from the trail data
- Identifies attestations with specific statuses (e.g., "MISSING", "COMPLETE")
- **Intentionally exits with code 1** when missing attestations are found

## Expected Workflow Output

When running the complete workflow, you'll see output similar to:

```bash
bash template-complete/check-template-complete.sh data.json MISSING
The following attestations have a 'MISSING' status:
- sbom
- unit-tests
Error: Process completed with exit code 1.
```

This exit code 1 behavior is **intentional** and demonstrates how CI/CD pipelines can programmatically detect incomplete compliance states and fail builds accordingly.

## Manual Usage

You can also check template completeness manually using the Kosli CLI:

```bash
kosli get trail <FLOW_NAME> <TRAIL_ID> -o json
```

For example:

```bash
kosli get trail dashboard-ci 1159a6f1193150681b8484545150334e89de6c1c --output=json
```

The JSON output contains the `attestations_statuses` field which indicates whether each attestation defined in your flow's template has been submitted for that specific trail.

## Flow Template Configuration

The example uses a flow template defined in `kosli-config/flow.yaml` that requires:

- An artifact named "app"
- Two attestations: "sbom" (generic type) and "unit-tests" (junit type)

Since the demonstration workflow only creates the artifact without submitting the required attestations, the template compliance check correctly identifies the missing attestations and fails the build.