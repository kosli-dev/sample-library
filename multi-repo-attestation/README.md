# Multi Repo Attestation

Create a scenario where you clone down a 2nd repo, and performs an attestation in that. What git commit is stored in kosli? And if you provide a --commit, are both then stored?

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
