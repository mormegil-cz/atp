#!/bin/sh

set -e

mysql at075 < at-0-7-5-structure.sql
bin/console database:importCondition 0.7.5
bin/console database:importItem 0.7.5
bin/console database:importQuest 0.7.5
bin/console database:importDroplist 0.7.5
bin/console database:importMonster 0.7.5
bin/console database:importMap 0.7.5
bin/console database:importDialog 0.7.5
bin/console database:assignItemQuest 0.7.5
bin/console database:assignNpcQuest 0.7.5
bin/console map:createAll 0.7.5
