# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `add_eks_resources` variable to control the creation of EKS-related resources.

### Changed

- Made `cluster_name` variable optional (defaults to `null`).
- Made EKS access entries and policy associations optional, controlled by `add_eks_resources`.

## [2.0.0] - 2026-04-28

### Changed

- BREAKING CHANGE: Refactored IAM roles and policies to create `admin` and `read-only`. These are AWS-wide and no longer limited to EKS access.

## [1.1.0] - 2026-03-12

### Added

- Comprehensive EKS permissions (AccessKubernetesApi, Describe*, List*) to `aerith-eks-admin` and `aerith-eks-admin-view` roles.
- `eks:DescribeCluster` permissions to `aerith-eks-admin` and `aerith-eks-admin-view` roles.

## [1.0.0] - 2026-03-12

### Initial Release

- `aerith-eks-admin` and `aerith-eks-admin-view` IAM roles.
- EKS Access Entry and Policy Association for `AmazonEKSClusterAdminPolicy` and `AmazonEKSAdminViewPolicy`.
