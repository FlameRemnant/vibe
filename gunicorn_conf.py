bind = "0.0.0.0:8000"
workers = 1 # static site; scale up if you need concurrency
threads = 2
accesslog = "-"
errorlog = "-"
keepalive = 5
timeout = 60
graceful_timeout = 30