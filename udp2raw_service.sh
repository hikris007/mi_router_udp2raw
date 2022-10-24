#!/bin/sh /etc/rc.common
# Copyright (C) 2022 Kris Allen i@atdawn.cc

START=89
STOP=11

USE_PROCD=1

UDP2RAW_HOME="/etc/udp2raw"

start_service() {
    procd_open_instance
    procd_set_param command $UDP2RAW_HOME/udp2raw --conf-file $UDP2RAW_HOME/config.conf
    procd_set_param user root
    procd_set_param stdout 1
    procd_set_param stderr 1
    procd_set_param pidfile $UDP2RAW_HOME/pid
    procd_set_param respawn
    procd_close_instance
}