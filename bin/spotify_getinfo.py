#!/usr/bin/python2

import dbus
bus = dbus.SessionBus()
player = bus.get_object('com.spotify.qt', '/')
iface = dbus.Interface(player, 'org.freedesktop.MediaPlayer2')
info = iface.GetMetadata()
# OUT: [dbus.String(u'xesam:album'), dbus.String(u'xesam:title'), dbus.String(u'xesam:trackNumber'), dbus.String(u'xesam:artist'), dbus.String(u'xesam:discNumber'), dbus.String(u'mpris:trackid'), dbus.String(u'mpris:length'), dbus.String(u'mpris:artUrl'), dbus.String(u'xesam:autoRating'), dbus.String(u'xesam:contentCreated'), dbus.String(u'xesam:url')]
print str(info['xesam:artist'][0]) + " - " + str(info['xesam:title'])
