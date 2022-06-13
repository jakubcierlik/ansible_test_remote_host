#!/usr/bin/env bash


set -e
DEPLOYMENT_PATH="/opt/manager/resources/deployments/${TENANT_ID}/${DEPLOYMENT_ID}"
BLUEPRINT_PATH="/opt/manager/resources/blueprints/${TENANT_ID}/${BLUEPRINT_ID}"

sudo mkdir -p ${DEPLOYMENT_PATH}
sudo chown -R centos:centos ${DEPLOYMENT_PATH}
sudo mkdir -p ${BLUEPRINT_PATH}
sudo chown -R centos:centos ${BLUEPRINT_PATH}

cat <<EOT > ${BLUEPRINT_PATH}/${PLAYBOOK_NAME}
---
- name: Test
  hosts: all
  become: true
  tasks:
  - name: Creating a test file with content
    copy:
      dest: "/tmp/test"
      content: |
        line test
EOT
