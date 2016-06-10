from salt.client.api import APIClient

client = APIClient()

mine_args = ('roles:ambari', 'host', 'grain')
resp = client.localClient.cmd('roles:ambari-server', 'mine.get', arg=mine_args, expr_form='grain')
hosts = resp.values()[0].values()
for host in hosts:
    print host
