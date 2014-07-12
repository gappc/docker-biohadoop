#!/bin/bash

jps | grep "ApplicationMaster\|WebSocketWorker" | cut -d' ' -f1 | xargs kill
