helm install cloudflare-tunnels cloudflare-tunnels-1.0.0.tgz -f cloudflare-tunnels/values.yaml --set secrets.stringData.token=$1