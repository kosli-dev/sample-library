# Multi Repo Attestation

This scenario covers the case where you clone down a second repository.
That repo could be external test-tools or other things related to qualifying the artifact
We want to perform attestations from that repository, over to the parent repository, maintaining a coherent attestation trail. 


## Scenario

* Clone down the this repo
* Attest one artifact
* Clone down another repo: https://github.com/sofusalbertsen/devbox-demo
* Attest files from the second repo with two different styles:
  * Attest to the trail AND the HEAD commit from parent repo.
  * attest to the trail, with no other additions.

Repo looks like this:

```Bash
.
├── LICENSE
├── README.md
├── artifact.txt
├── devbox-demo # Two files from a different git repo.
│   ├── LICENSE
│   └── README.md
├── multi-repo-attestation
│   ├── 1.sh
│   ├── README.md
│   └── kosli-config
│       └── flow.yaml
├── multi-trail-artifact
│   ├── 1.sh
│   ├── README.md
│   ├── kosli-config
│   │   └── flow.yaml
│   └── show-trails.sh
└── template-complete
    ├── 1.sh
    ├── 2.sh
    ├── README.md
    ├── check-template-complete.sh
    └── kosli-config
        └── flow.yaml
```
