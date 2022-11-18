#!/bin/bash
set -e

psql --user app_user app_db < /init_db.sql
