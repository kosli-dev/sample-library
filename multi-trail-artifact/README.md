# Multi trail artifact

This scenario exams the way Kosli behaves when the same binary artifact gets created multiple times, either in different flows, or in different git commits.

To test this, we mimic a monorepo. It is set up to have one GH action workflow per `application` in the repo; N workflows.

Given that all workflows riggers on all commits, that would translate into N flows, with N trails, all trails having the same name.

## Scenario 1

What would happen if we were to do a kosli search on an artifact having multiple trails with the same name (stemming from same commit)?

## Scenario 2

What would happen if we do a kosli search on an artifact that has been produced several times over multiple git commits.