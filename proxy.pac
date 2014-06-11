function FindProxyForURL(url, host) {
  if (shExpMatch(host, "*.loc.al")) {
    return "PROXY 127.0.0.1";
  }
  return "DIRECT";
}
