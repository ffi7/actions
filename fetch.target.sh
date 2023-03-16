#!/bin/bash
mv $3.yaml $4.yaml
mv $2.yaml $3.yaml
wget $1 -O $2.yaml
