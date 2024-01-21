#!/bin/bash
helm dependency update charts/$1
helm template $1 charts/$1 --debug