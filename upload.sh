#!/bin/bash
rm target/*
helm dependency update charts/$1
helm package -d target charts/$1
helm push target/$1-* oci://registry.gitlab.com/wojoinc/helm-charts