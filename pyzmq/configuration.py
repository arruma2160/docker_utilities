class Configuration:
    _port = 2222
    _ip = "192.168.0.5"

    @property
    def port(self):
        return Configuration._port

    @port.setter
    def port(self):
        return Configuration._port

    @property
    def ip(self):
        return Configuration._ip

    @ip.setter
    def ip(self):
        return Configuration._ip
    
