#!/bin/bash
wget $1 -O today.yaml
mv $3.yaml $4.yaml
mv $2.yaml $3.yaml
mv today.yaml $2.yaml
