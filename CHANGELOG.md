# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Added comprehensive EKS permissions (AccessKubernetesApi, Describe*, List*) to `aerith-eks-admin`, `aerith-eks-admin-view`, and `aerith-gemini-cli` roles.

- Added `aerith-gemini-cli` IAM role and policy for EKS management.
- Added `eks:DescribeCluster` permissions to `aerith-eks-admin` and `aerith-eks-admin-view` roles.

### Fixes

### Changes

- Updated `trust_arn` variable to default to `null` and use `aerith-gemini-cli` as fallback.
- Switched `eks_admin` and `eks_admin_view` roles to use local `trust_arn`.

### Removals

## [1.0.0] - 2026-03-12

### Added

- Added `aerith-eks-admin` and `aerith-eks-admin-view` IAM roles.
- Added EKS access entries and policy associations for cluster administration and viewing.
- Added `cluster_name` and `trust_arn` variables.

## [0.0.0] - 2026-03-12

### Added

- Template repository created
