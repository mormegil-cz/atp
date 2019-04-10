#!/bin/sh

mysql at075 < at-0-7-5-structure.sql
bin/console database:importCondition
bin/console database:importItem
bin/console database:importDroplist
