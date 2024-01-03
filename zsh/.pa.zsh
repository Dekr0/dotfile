firefox_sink()
{
    pacmd load-module module-null-sink sink_name=obs_firefox_sink sink_properties=device.description=obs_firefox_sink
    pacmd update-sink-proplist obs_firefox_sink device.description='"obs firefox capture"'
}
