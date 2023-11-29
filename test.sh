#!/bin/bash
helm dependency update charts/bazarr
helm template bazarr charts/bazarr --debug