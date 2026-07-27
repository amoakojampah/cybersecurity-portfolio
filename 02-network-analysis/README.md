# Network Structure and Security Analysis

## Overview

Based on network installation and support work performed at Squareline Technologies Limited, this analysis examines a typical flat small-office network topology and identifies structural weaknesses.

## Current Network Layout

```mermaid
graph TD
    A[Internet] --> B[ISP Modem/Router]
    B --> C[Core Switch]
    C --> D[Staff Wi-Fi]
    C --> E[Guest Wi-Fi]
    C --> F[File Server]
    C --> G[Printers/Workstations]
