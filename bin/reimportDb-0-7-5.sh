#!/bin/sh

set -e

mysql at075 < at-0-7-5-structure.sql
bin/console database:importCondition --version=0.7.5
bin/console database:importItem --version=0.7.5
bin/console database:importQuest --version=0.7.5
bin/console database:importDroplist --version=0.7.5
bin/console database:importMonster --version=0.7.5
bin/console database:importMap --version=0.7.5
bin/console database:importDialog --version=0.7.5
bin/console database:assignItemQuest --version=0.7.5
bin/console database:assignNpcQuest --version=0.7.5
bin/console map:createAll --version=0.7.5
