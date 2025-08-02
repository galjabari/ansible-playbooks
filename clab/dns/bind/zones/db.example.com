$TTL 86400
@     IN  SOA     example.com. admin.example.com. (
                  2025071101 ; Serial
                  3600       ; Refresh
                  1800       ; Retry
                  604800     ; Expire
                  86400 )    ; Negative Cache TTL
@     IN  NS      ns1.example.com.
ns1   IN  A       192.168.10.10
@     IN  A       192.168.10.11
www   IN  CNAME   example.com.